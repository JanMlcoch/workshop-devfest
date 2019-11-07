import 'dart:async';

import 'package:core/src/auth_service.dart';
import 'package:core/src/game_service.dart';
import 'package:dfunc/dfunc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sealed_unions/sealed_unions.dart';

import 'models.dart';

class GameBloc {
  GameBloc(this._gameService, this._authService) {
    _userSubscription =
        Observable(_authService.currentUserId).switchMap((userId) {
      if (userId == null) return Observable.just(GameState.unauthenticated());

      return _gameService.getQuestions(userId).map((questions) {
        if (questions.isEmpty) return GameState.noGame();

        final currentQuestion =
            questions.firstWhere((q) => !q.isAnswered, orElse: () => null);

        if (currentQuestion == null) {
          return GameState.completed(
            _calculateRightAnswerCount(questions),
            questions.length,
          );
        }

        return GameState.inProgress(currentQuestion, questions.length);
      });
    }).listen(_state.add);
  }

  final BehaviorSubject<GameState> _state =
      BehaviorSubject.seeded(GameState.unauthenticated());

  StreamSubscription _userSubscription;

  final GameService _gameService;
  final AuthService _authService;

  Stream<GameState> get state => _state.stream;

  Future<void> authenticate() async {
    await _authService.authenticate();
  }

  Future<void> startGame() async {
    final userId = await _authService.currentUserId.first;

    final templates = await _gameService.getQuestionTemplates();
    final questions = mapIndexed(
        (i, t) => Question((b) => b
          ..questionId = t.questionId
          ..text = t.text
          ..answers = t.answers.toBuilder()
          ..rightAnswerId = t.rightAnswerId
          ..position = i + 1),
        templates);

    await _gameService.startGame(userId, questions.toList());
  }

  Future<void> resetGame() async {
    final userId = await _authService.currentUserId.first;
    await _gameService.reset(userId);
  }

  Future<void> answerQuestion(Question question, String answerId) async {
    final userId = await _authService.currentUserId.first;
    await _gameService.answerQuestion(userId, question.questionId, answerId);
  }

  void dispose() {
    _userSubscription.cancel();
    _state.close();
  }

  int _calculateRightAnswerCount(Iterable<Question> questions) => questions
      .fold(0, (value, question) => value + (question.isRight ? 1 : 0));
}

class GameState
    extends Union4Impl<Unauthenticated, NoGame, InProgress, Completed> {
  static const Quartet<Unauthenticated, NoGame, InProgress, Completed> factory =
      Quartet();

  GameState._(Union4<Unauthenticated, NoGame, InProgress, Completed> union)
      : super(union);

  factory GameState.unauthenticated() =>
      GameState._(factory.first(Unauthenticated()));

  factory GameState.noGame() => GameState._(factory.second(NoGame()));

  factory GameState.inProgress(Question question, int questionCount) =>
      GameState._(factory.third(InProgress(question, questionCount)));

  factory GameState.completed(int rightAnswerCount, int totalQuestionCount) =>
      GameState._(factory.fourth(Completed(
        rightAnswerCount: rightAnswerCount,
        totalQuestionCount: totalQuestionCount,
      )));
}

class Unauthenticated {}

class NoGame {}

class InProgress {
  InProgress(this.question, this.questionCount);

  final Question question;
  final int questionCount;
}

class Completed {
  Completed({this.rightAnswerCount, this.totalQuestionCount});

  final int rightAnswerCount;

  final int totalQuestionCount;
}

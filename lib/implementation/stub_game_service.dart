import 'package:built_collection/built_collection.dart';
import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

class StubGameService implements GameService {
  final BehaviorSubject<BuiltList<Question>> _questions =
      BehaviorSubject.seeded(BuiltList([]));

  final List<QuestionTemplate> _templates = [
    QuestionTemplate((b) => b
      ..questionId = '1'
      ..text = 'Question 1'
      ..rightAnswerId = 'A'
      ..answers = BuiltList<Answer>([
        Answer((b) => b
          ..answerId = 'A'
          ..text = 'Answer A'),
        Answer((b) => b
          ..answerId = 'B'
          ..text = 'Answer B'),
      ]).toBuilder()),
    QuestionTemplate((b) => b
      ..questionId = '2'
      ..text = 'Question 2'
      ..rightAnswerId = 'B'
      ..answers = BuiltList<Answer>([
        Answer((b) => b
          ..answerId = 'A'
          ..text = 'Answer A'),
        Answer((b) => b
          ..answerId = 'B'
          ..text = 'Answer B'),
      ]).toBuilder()),
  ];

  @override
  Future<void> answerQuestion(
    String userId,
    String questionId,
    String answerId,
  ) async {
    _questions.add(_questions.value.rebuild((b) => b
      ..map((qb) => qb.questionId == questionId
          ? qb.rebuild((q) => q..userAnswerId = answerId)
          : qb)));
  }

  @override
  Future<List<QuestionTemplate>> getQuestionTemplates() async => _templates;

  @override
  Stream<List<Question>> getQuestions(String userId) =>
      _questions.stream.map((s) => s.toList());

  @override
  Future<void> startGame(String userId, List<Question> questions) async {
    _questions.add(BuiltList(questions));
  }

  @override
  Future<void> reset(String userId) async {
    _questions.add(BuiltList());
  }
}

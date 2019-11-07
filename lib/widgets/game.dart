import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/widgets/auth_screen.dart';
import 'package:workshop/widgets/question_screen.dart';
import 'package:workshop/widgets/results_screen.dart';
import 'package:workshop/widgets/start_game_screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = GameBloc(Provider.of(context), Provider.of(context));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<GameState>(
        stream: _bloc.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          return snapshot.data.join(
            (_) => AuthScreen(),
            (_) => StartGameScreen(onStartPressed: _bloc.startGame),
            (game) => QuestionScreen(
              game: game,
              onAnswerPressed: (question, answer) {
                _bloc.answerQuestion(question, answer.answerId);
              },
            ),
            (game) => ResultsScreen(
              completedGame: game,
              onResetPressed: () {
                _bloc.resetGame();
              },
            ),
          );
        },
      ),
    );
  }
}

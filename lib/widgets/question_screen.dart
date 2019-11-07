import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:workshop/widgets/screen.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    Key key,
    @required this.game,
    @required this.onAnswerPressed,
  }) : super(key: key);

  final InProgress game;
  final void Function(Question quest, Answer answer) onAnswerPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Question ${game.question.position} of ${game.questionCount}',
          ),
        ),
        body: Screen(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    game.question.text,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                ...game.question.answers.map(_buildAnswerButton),
              ],
            ),
          ),
        ),
      );

  Widget _buildAnswerButton(Answer answer) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FlatButton(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer.text,
            ),
          ),
          onPressed: () {
            onAnswerPressed(game.question, answer);
          },
        ),
      );
}

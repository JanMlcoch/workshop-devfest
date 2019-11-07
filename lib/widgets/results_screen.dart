import 'package:core/core.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:workshop/widgets/screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key key,
    @required this.completedGame,
    @required this.onResetPressed,
  }) : super(key: key);

  final Completed completedGame;
  final VoidCallback onResetPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good job!'),
      ),
      body: Screen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: FractionallySizedBox(
                widthFactor: .5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: FlareActor(
                    'assets/Trofeo.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    animation: 'Untitled',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "You've finished the game\nwith result:",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${completedGame.rightAnswerCount} / ${completedGame.totalQuestionCount}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: RaisedButton(
                child: Text('Reset'),
                onPressed: onResetPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

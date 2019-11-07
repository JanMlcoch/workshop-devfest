import 'package:flutter/material.dart';
import 'package:workshop/widgets/screen.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({Key key, @required this.onStartPressed})
      : super(key: key);

  final VoidCallback onStartPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Screen(
          child: Center(
            child: RaisedButton(
              child: Text('Start game'),
              onPressed: onStartPressed,
            ),
          ),
        ),
      );
}

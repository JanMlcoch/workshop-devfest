import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/widgets/game.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => GameScreen();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AuthService>(context).init();
  }
}

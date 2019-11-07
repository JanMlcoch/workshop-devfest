import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/widgets/screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of(context);

    return Scaffold(
      body: Screen(
        child: Center(
          child: RaisedButton(
            child: Text('Sign in with Google'),
            onPressed: () {
              authService.authenticate();
            },
          ),
        ),
      ),
    );
  }
}

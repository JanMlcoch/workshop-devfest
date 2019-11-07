import 'package:core/core.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workshop/implementation/web_auth_service.dart';
import 'package:workshop/implementation/web_game_service.dart';
import 'package:workshop/main.dart';

void main() {
  initializeApp(
    apiKey: 'AIzaSyCKkxt5xOI87bDn_92gwwRUWSpbU9YnRNc',
    projectId: 'flutter-workshop-d7d60',
    authDomain: 'flutter-workshop-d7d60.firebaseapp.com',
  );

  final AuthService authService = WebAuthService();
  final GameService gameService = WebGameService();
  runApp(MultiProvider(
    providers: [
      Provider.value(value: authService),
      Provider.value(value: gameService),
    ],
    child: MyApp(),
  ));
}

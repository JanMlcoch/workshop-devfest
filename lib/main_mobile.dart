import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workshop/implementation/stub_auth_service.dart';
import 'package:workshop/implementation/stub_game_service.dart';
import 'package:workshop/main.dart';

void main() {
  final AuthService authService = StubAuthService();
  final GameService gameService = StubGameService();
  runApp(MultiProvider(
    providers: [
      Provider.value(value: authService),
      Provider.value(value: gameService),
    ],
    child: MyApp(),
  ));
}

import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:workshop/implementation/mobile_auth_service.dart';
import 'package:workshop/implementation/mobile_game_service.dart';
import 'package:workshop/main.dart';

void main() {
  final AuthService authService = MobileAuthService();
  final GameService gameService = MobileGameService();
  runApp(MultiProvider(
    providers: [
      Provider.value(value: authService),
      Provider.value(value: gameService),
    ],
    child: MyApp(),
  ));
}

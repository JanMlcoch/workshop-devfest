import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:core/src/models.dart';

part 'game.g.dart';

abstract class Game implements Built<Game, GameBuilder> {
  factory Game([Function(GameBuilder b) updates]) =>
      _$Game((b) => b..update(updates));

  Game._();

  BuiltList<Question> get questions;

  @nullable
  int get rightAnswerCount;
}

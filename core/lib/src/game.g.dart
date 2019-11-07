// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Game extends Game {
  @override
  final BuiltList<Question> questions;
  @override
  final int rightAnswerCount;

  factory _$Game([void Function(GameBuilder) updates]) =>
      (new GameBuilder()..update(updates)).build();

  _$Game._({this.questions, this.rightAnswerCount}) : super._() {
    if (questions == null) {
      throw new BuiltValueNullFieldError('Game', 'questions');
    }
  }

  @override
  Game rebuild(void Function(GameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameBuilder toBuilder() => new GameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Game &&
        questions == other.questions &&
        rightAnswerCount == other.rightAnswerCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, questions.hashCode), rightAnswerCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Game')
          ..add('questions', questions)
          ..add('rightAnswerCount', rightAnswerCount))
        .toString();
  }
}

class GameBuilder implements Builder<Game, GameBuilder> {
  _$Game _$v;

  ListBuilder<Question> _questions;
  ListBuilder<Question> get questions =>
      _$this._questions ??= new ListBuilder<Question>();
  set questions(ListBuilder<Question> questions) =>
      _$this._questions = questions;

  int _rightAnswerCount;
  int get rightAnswerCount => _$this._rightAnswerCount;
  set rightAnswerCount(int rightAnswerCount) =>
      _$this._rightAnswerCount = rightAnswerCount;

  GameBuilder();

  GameBuilder get _$this {
    if (_$v != null) {
      _questions = _$v.questions?.toBuilder();
      _rightAnswerCount = _$v.rightAnswerCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Game other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Game;
  }

  @override
  void update(void Function(GameBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Game build() {
    _$Game _$result;
    try {
      _$result = _$v ??
          new _$Game._(
              questions: questions.build(), rightAnswerCount: rightAnswerCount);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Game', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

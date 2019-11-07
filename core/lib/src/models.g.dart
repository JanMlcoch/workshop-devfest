// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Answer> _$answerSerializer = new _$AnswerSerializer();
Serializer<QuestionTemplate> _$questionTemplateSerializer =
    new _$QuestionTemplateSerializer();
Serializer<Question> _$questionSerializer = new _$QuestionSerializer();

class _$AnswerSerializer implements StructuredSerializer<Answer> {
  @override
  final Iterable<Type> types = const [Answer, _$Answer];
  @override
  final String wireName = 'Answer';

  @override
  Iterable<Object> serialize(Serializers serializers, Answer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'answerId',
      serializers.serialize(object.answerId,
          specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Answer deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnswerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'answerId':
          result.answerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionTemplateSerializer
    implements StructuredSerializer<QuestionTemplate> {
  @override
  final Iterable<Type> types = const [QuestionTemplate, _$QuestionTemplate];
  @override
  final String wireName = 'QuestionTemplate';

  @override
  Iterable<Object> serialize(Serializers serializers, QuestionTemplate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'questionId',
      serializers.serialize(object.questionId,
          specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'answers',
      serializers.serialize(object.answers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Answer)])),
      'rightAnswerId',
      serializers.serialize(object.rightAnswerId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  QuestionTemplate deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionTemplateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'questionId':
          result.questionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Answer)]))
              as BuiltList<dynamic>);
          break;
        case 'rightAnswerId':
          result.rightAnswerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionSerializer implements StructuredSerializer<Question> {
  @override
  final Iterable<Type> types = const [Question, _$Question];
  @override
  final String wireName = 'Question';

  @override
  Iterable<Object> serialize(Serializers serializers, Question object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'position',
      serializers.serialize(object.position,
          specifiedType: const FullType(int)),
      'questionId',
      serializers.serialize(object.questionId,
          specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'answers',
      serializers.serialize(object.answers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Answer)])),
      'rightAnswerId',
      serializers.serialize(object.rightAnswerId,
          specifiedType: const FullType(String)),
    ];
    if (object.userAnswerId != null) {
      result
        ..add('userAnswerId')
        ..add(serializers.serialize(object.userAnswerId,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Question deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userAnswerId':
          result.userAnswerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'questionId':
          result.questionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Answer)]))
              as BuiltList<dynamic>);
          break;
        case 'rightAnswerId':
          result.rightAnswerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Answer extends Answer {
  @override
  final String answerId;
  @override
  final String text;

  factory _$Answer([void Function(AnswerBuilder) updates]) =>
      (new AnswerBuilder()..update(updates)).build();

  _$Answer._({this.answerId, this.text}) : super._() {
    if (answerId == null) {
      throw new BuiltValueNullFieldError('Answer', 'answerId');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Answer', 'text');
    }
  }

  @override
  Answer rebuild(void Function(AnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnswerBuilder toBuilder() => new AnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Answer && answerId == other.answerId && text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, answerId.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Answer')
          ..add('answerId', answerId)
          ..add('text', text))
        .toString();
  }
}

class AnswerBuilder implements Builder<Answer, AnswerBuilder> {
  _$Answer _$v;

  String _answerId;
  String get answerId => _$this._answerId;
  set answerId(String answerId) => _$this._answerId = answerId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  AnswerBuilder();

  AnswerBuilder get _$this {
    if (_$v != null) {
      _answerId = _$v.answerId;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Answer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Answer;
  }

  @override
  void update(void Function(AnswerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Answer build() {
    final _$result = _$v ?? new _$Answer._(answerId: answerId, text: text);
    replace(_$result);
    return _$result;
  }
}

class _$QuestionTemplate extends QuestionTemplate {
  @override
  final String questionId;
  @override
  final String text;
  @override
  final BuiltList<Answer> answers;
  @override
  final String rightAnswerId;

  factory _$QuestionTemplate(
          [void Function(QuestionTemplateBuilder) updates]) =>
      (new QuestionTemplateBuilder()..update(updates)).build();

  _$QuestionTemplate._(
      {this.questionId, this.text, this.answers, this.rightAnswerId})
      : super._() {
    if (questionId == null) {
      throw new BuiltValueNullFieldError('QuestionTemplate', 'questionId');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('QuestionTemplate', 'text');
    }
    if (answers == null) {
      throw new BuiltValueNullFieldError('QuestionTemplate', 'answers');
    }
    if (rightAnswerId == null) {
      throw new BuiltValueNullFieldError('QuestionTemplate', 'rightAnswerId');
    }
  }

  @override
  QuestionTemplate rebuild(void Function(QuestionTemplateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionTemplateBuilder toBuilder() =>
      new QuestionTemplateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionTemplate &&
        questionId == other.questionId &&
        text == other.text &&
        answers == other.answers &&
        rightAnswerId == other.rightAnswerId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, questionId.hashCode), text.hashCode), answers.hashCode),
        rightAnswerId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionTemplate')
          ..add('questionId', questionId)
          ..add('text', text)
          ..add('answers', answers)
          ..add('rightAnswerId', rightAnswerId))
        .toString();
  }
}

class QuestionTemplateBuilder
    implements Builder<QuestionTemplate, QuestionTemplateBuilder> {
  _$QuestionTemplate _$v;

  String _questionId;
  String get questionId => _$this._questionId;
  set questionId(String questionId) => _$this._questionId = questionId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  ListBuilder<Answer> _answers;
  ListBuilder<Answer> get answers =>
      _$this._answers ??= new ListBuilder<Answer>();
  set answers(ListBuilder<Answer> answers) => _$this._answers = answers;

  String _rightAnswerId;
  String get rightAnswerId => _$this._rightAnswerId;
  set rightAnswerId(String rightAnswerId) =>
      _$this._rightAnswerId = rightAnswerId;

  QuestionTemplateBuilder();

  QuestionTemplateBuilder get _$this {
    if (_$v != null) {
      _questionId = _$v.questionId;
      _text = _$v.text;
      _answers = _$v.answers?.toBuilder();
      _rightAnswerId = _$v.rightAnswerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionTemplate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$QuestionTemplate;
  }

  @override
  void update(void Function(QuestionTemplateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionTemplate build() {
    _$QuestionTemplate _$result;
    try {
      _$result = _$v ??
          new _$QuestionTemplate._(
              questionId: questionId,
              text: text,
              answers: answers.build(),
              rightAnswerId: rightAnswerId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'answers';
        answers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuestionTemplate', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Question extends Question {
  @override
  final String userAnswerId;
  @override
  final int position;
  @override
  final String questionId;
  @override
  final String text;
  @override
  final BuiltList<Answer> answers;
  @override
  final String rightAnswerId;

  factory _$Question([void Function(QuestionBuilder) updates]) =>
      (new QuestionBuilder()..update(updates)).build();

  _$Question._(
      {this.userAnswerId,
      this.position,
      this.questionId,
      this.text,
      this.answers,
      this.rightAnswerId})
      : super._() {
    if (position == null) {
      throw new BuiltValueNullFieldError('Question', 'position');
    }
    if (questionId == null) {
      throw new BuiltValueNullFieldError('Question', 'questionId');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Question', 'text');
    }
    if (answers == null) {
      throw new BuiltValueNullFieldError('Question', 'answers');
    }
    if (rightAnswerId == null) {
      throw new BuiltValueNullFieldError('Question', 'rightAnswerId');
    }
  }

  @override
  Question rebuild(void Function(QuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBuilder toBuilder() => new QuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
        userAnswerId == other.userAnswerId &&
        position == other.position &&
        questionId == other.questionId &&
        text == other.text &&
        answers == other.answers &&
        rightAnswerId == other.rightAnswerId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, userAnswerId.hashCode), position.hashCode),
                    questionId.hashCode),
                text.hashCode),
            answers.hashCode),
        rightAnswerId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Question')
          ..add('userAnswerId', userAnswerId)
          ..add('position', position)
          ..add('questionId', questionId)
          ..add('text', text)
          ..add('answers', answers)
          ..add('rightAnswerId', rightAnswerId))
        .toString();
  }
}

class QuestionBuilder implements Builder<Question, QuestionBuilder> {
  _$Question _$v;

  String _userAnswerId;
  String get userAnswerId => _$this._userAnswerId;
  set userAnswerId(String userAnswerId) => _$this._userAnswerId = userAnswerId;

  int _position;
  int get position => _$this._position;
  set position(int position) => _$this._position = position;

  String _questionId;
  String get questionId => _$this._questionId;
  set questionId(String questionId) => _$this._questionId = questionId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  ListBuilder<Answer> _answers;
  ListBuilder<Answer> get answers =>
      _$this._answers ??= new ListBuilder<Answer>();
  set answers(ListBuilder<Answer> answers) => _$this._answers = answers;

  String _rightAnswerId;
  String get rightAnswerId => _$this._rightAnswerId;
  set rightAnswerId(String rightAnswerId) =>
      _$this._rightAnswerId = rightAnswerId;

  QuestionBuilder();

  QuestionBuilder get _$this {
    if (_$v != null) {
      _userAnswerId = _$v.userAnswerId;
      _position = _$v.position;
      _questionId = _$v.questionId;
      _text = _$v.text;
      _answers = _$v.answers?.toBuilder();
      _rightAnswerId = _$v.rightAnswerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Question other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Question;
  }

  @override
  void update(void Function(QuestionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Question build() {
    _$Question _$result;
    try {
      _$result = _$v ??
          new _$Question._(
              userAnswerId: userAnswerId,
              position: position,
              questionId: questionId,
              text: text,
              answers: answers.build(),
              rightAnswerId: rightAnswerId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'answers';
        answers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Question', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

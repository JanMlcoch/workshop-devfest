import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'models.g.dart';

abstract class Answer implements Built<Answer, AnswerBuilder> {
  factory Answer([Function(AnswerBuilder b) updates]) =>
      _$Answer((b) => b..update(updates));

  Answer._();

  static Serializer<Answer> get serializer => _$answerSerializer;

  String get answerId;

  String get text;
}

abstract class BaseQuestion {
  String get questionId;

  String get text;

  BuiltList<Answer> get answers;

  String get rightAnswerId;
}

abstract class QuestionTemplate
    implements Built<QuestionTemplate, QuestionTemplateBuilder>, BaseQuestion {
  factory QuestionTemplate([Function(QuestionTemplateBuilder b) updates]) =>
      _$QuestionTemplate((b) => b..update(updates));

  QuestionTemplate._();

  static Serializer<QuestionTemplate> get serializer =>
      _$questionTemplateSerializer;
}

abstract class Question
    implements Built<Question, QuestionBuilder>, BaseQuestion {
  factory Question([Function(QuestionBuilder b) updates]) =>
      _$Question((b) => b..update(updates));

  Question._();

  static Serializer<Question> get serializer => _$questionSerializer;

  @nullable
  String get userAnswerId;

  int get position;

  bool get isAnswered => userAnswerId != null;

  bool get isRight => rightAnswerId == userAnswerId;
}

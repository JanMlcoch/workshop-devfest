import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:core/core.dart';

part 'serializers.g.dart';

@SerializersFor([
  Answer,
  Question,
  QuestionTemplate,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

Question deserializeQuestion(Map<String, dynamic> json) =>
    serializers.deserializeWith(Question.serializer, json);

Map<String, dynamic> serializeQuestion(Question question) =>
    serializers.serializeWith(Question.serializer, question);

QuestionTemplate deserializeQuestionTemplate(Map<String, dynamic> json) =>
    serializers.deserializeWith(QuestionTemplate.serializer, json);

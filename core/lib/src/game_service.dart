import 'package:core/src/models.dart';

abstract class GameService {
  Future<List<QuestionTemplate>> getQuestionTemplates();

  Stream<List<Question>> getQuestions(String userId);

  Future<void> startGame(String userId, List<Question> questions);

  Future<void> reset(String userId);

  Future<void> answerQuestion(
    String userId,
    String questionId,
    String answerId,
  );
}

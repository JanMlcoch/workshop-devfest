import 'package:core/core.dart';
import 'package:firebase/firebase.dart';

class WebGameService implements GameService {
  @override
  Future<void> answerQuestion(
    String userId,
    String questionId,
    String answerId,
  ) =>
      firestore()
          .collection('games')
          .doc(userId)
          .collection('questions')
          .doc(questionId)
          .update(data: {'userAnswerId': answerId});

  @override
  Future<List<QuestionTemplate>> getQuestionTemplates() =>
      firestore().collection('questions').get().then((s) => s.docs
          .map((d) => d.data())
          .map(deserializeQuestionTemplate)
          .toList());

  @override
  Stream<List<Question>> getQuestions(String userId) => firestore()
      .collection('games')
      .doc(userId)
      .collection('questions')
      .onSnapshot
      .map(
          (s) => s.docs.map((d) => d.data()).map(deserializeQuestion).toList());

  @override
  Future<void> reset(String userId) => firestore()
      .collection('games')
      .doc(userId)
      .collection('questions')
      .get()
      .then((s) => s.docs.forEach((d) => d.ref.delete()));

  @override
  Future<void> startGame(String userId, List<Question> questions) async {
    final batch = firestore().batch();
    final ref =
        firestore().collection('games').doc(userId).collection('questions');
    questions.forEach((q) {
      final data = serializeQuestion(q);
      batch.set(ref.doc(q.questionId), data);
    });
    await batch.commit();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

class MobileGameService implements GameService {
  @override
  Future<void> answerQuestion(
    String userId,
    String questionId,
    String answerId,
  ) =>
      Firestore.instance
          .collection('games')
          .document(userId)
          .collection('questions')
          .document(questionId)
          .updateData({'userAnswerId': answerId});

  @override
  Future<List<QuestionTemplate>> getQuestionTemplates() => Firestore.instance
      .collection('questions')
      .getDocuments()
      .then((s) => s.documents
          .map((d) => d.data)
          .map(deserializeQuestionTemplate)
          .toList());

  @override
  Stream<List<Question>> getQuestions(String userId) => Firestore.instance
      .collection('games')
      .document(userId)
      .collection('questions')
      .snapshots()
      .map((s) =>
          s.documents.map((d) => d.data).map(deserializeQuestion).toList());

  @override
  Future<void> reset(String userId) => Firestore.instance
      .collection('games')
      .document(userId)
      .collection('questions')
      .getDocuments()
      .then((s) => s.documents.forEach((d) => d.reference.delete()));

  @override
  Future<void> startGame(String userId, List<Question> questions) async {
    final batch = Firestore.instance.batch();
    final ref = Firestore.instance
        .collection('games')
        .document(userId)
        .collection('questions')
        .reference();
    questions.forEach((q) {
      final data = serializeQuestion(q);
      batch.setData(ref.document(q.questionId), data);
    });
    await batch.commit();
  }
}

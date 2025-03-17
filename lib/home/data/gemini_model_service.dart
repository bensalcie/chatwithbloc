import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeModelService {
  final GenerativeModel model;

  GenerativeModelService({required String apiKey})
    : model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        safetySettings: [],
      );

  Future<String?> generateContent(Iterable<Content> content) async {
    final response = await model.generateContent(content);
    return response.text;
  }
}

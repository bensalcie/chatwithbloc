import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeModelService {
  final GenerativeModel model;

  GenerativeModelService({required String apiKey})
    : model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
        safetySettings: [],
      );

  Future<String?> generateContent(Iterable<Content> content) async {
    try {
      final response = await model.generateContent(content);
    return response.text;
    } catch (e) {
      return e.toString();
    }
    
  }
}

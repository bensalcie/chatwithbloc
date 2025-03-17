import 'package:chatwithbloc/home/data/gemini_model_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModules {
  // Register Gemini API.
  @singleton
  @Named('ApiKey')
  String get apiKey => dotenv.env['GEMINI_API_KEY']!;

  @lazySingleton
  GenerativeModelService generativeModelService(
    @Named('ApiKey') String apiKey,
  ) {
    return GenerativeModelService(apiKey: apiKey);
  }
}

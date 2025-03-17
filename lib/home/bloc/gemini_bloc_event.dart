part of 'gemini_bloc_bloc.dart';

@immutable
sealed class GeminiBlocEvent {}

 class AskGemini extends GeminiBlocEvent {
  final String prompt;

  AskGemini({required this.prompt});
}

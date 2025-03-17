part of 'gemini_bloc_bloc.dart';

@immutable
sealed class GeminiBlocEvent {}

sealed class AskGemini extends GeminiBlocEvent {
  final String prompt;

  AskGemini({required this.prompt});
}

part of 'gemini_bloc_bloc.dart';

@immutable
sealed class GeminiBlocState {}

final class GeminiBlocInitial extends GeminiBlocState {}

final class GeminiBlocLoading extends GeminiBlocState {}

final class GeminiBlocSuccess extends GeminiBlocState {
  final List<ChatModel> latestChat;
  GeminiBlocSuccess({required this.latestChat});
}

final class GeminiBlocError extends GeminiBlocState {
  final String errormessage;
  GeminiBlocError({required this.errormessage});
}

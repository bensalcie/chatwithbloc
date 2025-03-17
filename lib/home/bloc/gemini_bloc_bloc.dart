import 'dart:async';

import 'package:chatwithbloc/home/data/gemini_model_service.dart';
import 'package:chatwithbloc/home/data/models/chat_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

part 'gemini_bloc_event.dart';
part 'gemini_bloc_state.dart';

final List<ChatModel> chats = [];

@injectable
class GeminiBlocBloc extends Bloc<GeminiBlocEvent, GeminiBlocState> {
  GenerativeModelService _generativeModelService;
  GeminiBlocBloc(this._generativeModelService) : super(GeminiBlocInitial()) {
    on<AskGemini>(_onAskGemini);
  }

  FutureOr<void> _onAskGemini(
    AskGemini event,
    Emitter<GeminiBlocState> emit,
  ) async {
    emit(GeminiBlocLoading());
    chats.add(ChatModel(message: event.prompt, issender: true));
    try {
      final content = [Content.text(event.prompt)];
      final response = await _generativeModelService.generateContent(content);
      final geminireply =
          response ?? 'I have no answer for this, try something else';
      final geminiResponse = ChatModel(message: geminireply, issender: false);
      chats.add(geminiResponse);

      emit(GeminiBlocSuccess(latestChat: chats.toSet().toList()));
    } catch (e) {
      emit(GeminiBlocError(errormessage: 'Something went wrong'));
    }
  }
}

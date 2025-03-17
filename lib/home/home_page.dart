import 'package:chatwithbloc/home/bloc/gemini_bloc_bloc.dart';
import 'package:chatwithbloc/home/widgets/app_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController chatInputController = TextEditingController();

  final ValueNotifier<bool> _isFabVisible = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chat with Bloc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<GeminiBloc, GeminiBlocState>(
              builder: (context, state) {
                var latestchats = chats;
                if (state is GeminiBlocSuccess) {
                  latestchats = state.latestChat;
                }
                return latestchats.isNotEmpty
                    ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: latestchats.length,
                      itemBuilder: (context, index) {
                        final chat = latestchats[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              chat.issender
                                  ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person_2_rounded,
                                      size: 32,
                                    ),
                                  )
                                  : const SizedBox.shrink(),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  chat.message,
                                  textAlign:
                                      chat.issender
                                          ? TextAlign.start
                                          : TextAlign.end,
                                ),
                              ),
                              !chat.issender
                                  ? Icon(Icons.personal_injury, size: 32)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        );
                      },
                    )
                    : Center(child: Text('Ask Gemini Anything to get started'));
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: ValueListenableBuilder(
        valueListenable: _isFabVisible,
        builder: (context, value, child) {
          return value
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: AppEditText(
                        controller: chatInputController,
                        type: TextInputType.text,
                        inputHint: 'Ask me Anything...',
                      ),
                    ),
                    BlocBuilder<GeminiBloc, GeminiBlocState>(
                      builder: (context, state) {
                        if (state is GeminiBlocLoading) {
                          return const CircularProgressIndicator();
                        }
                        return IconButton(
                          onPressed: () {
                            final chat = chatInputController.text;
                            if (chat.isNotEmpty) {
                              context.read<GeminiBloc>().add(
                                AskGemini(prompt: chat),
                              );
                              // chats.add(
                              //   ChatModel(message: chat, issender: true),
                              // );
                              chatInputController.clear();
                            }
                          },
                          icon: Icon(Icons.send),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
              : const SizedBox.shrink();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

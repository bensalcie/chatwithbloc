import 'package:chatwithbloc/home/widgets/app_edit_text.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
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
                    const IconButton(onPressed: null, icon: Icon(Icons.send)),
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

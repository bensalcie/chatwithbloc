import 'package:chatwithbloc/app.dart';
import 'package:chatwithbloc/core/di/injection.dart';
import 'package:chatwithbloc/core/utils/app_global_observer.dart';
import 'package:chatwithbloc/home/bloc/gemini_bloc_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  if (kDebugMode) {
    await dotenv.load(fileName: ".dev.env");
    Bloc.observer = AppGlobalBlocObserver();
  } else {
    await dotenv.load(fileName: ".env");
  }
  await configureDependencies();

  runApp(
    BlocProvider(
      create: (context) => getIt<GeminiBloc>(),
      child: const MyApp(),
    ),
  );
}

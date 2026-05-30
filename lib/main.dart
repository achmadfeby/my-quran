import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/core/di/injection.dart';
import 'package:my_quran/feature/quran/persentation/page/surah_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: Injection.repositoryProviders,
      child: MultiBlocProvider(
        providers: Injection.blocProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            iconTheme: const IconThemeData(
              color: Colors.green,
            ),
            useMaterial3: true,
          ),
          home: const SurahPage(),
        ),
      ),
    );
  }
}

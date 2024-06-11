import 'package:flutter/material.dart';
import 'package:flutter_counter_riverpod/counter_state.dart';
import 'package:flutter_counter_riverpod/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

final counterStateNotifier =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
  (ref) {
    return CounterStateNotifier(
      CounterState(colorIndex: 0, counter: 0),
    );
  },
);

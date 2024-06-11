import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_counter_riverpod/counter_state.dart';
import 'package:flutter_counter_riverpod/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter with Riverpod'),
        actions: [
          IconButton(
              onPressed: () {
                final res = ref.refresh(counterStateNotifier);
                log('current state: counter:${res.counter}, colorIndex: ${res.colorIndex}');
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              ref.watch(counterStateNotifier
                  .select((value) => value.counter.toString())),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: colors[ref.watch(counterStateNotifier
                      .select((value) => value.colorIndex))]),
            ),
            ElevatedButton(
              onPressed: ref.read(counterStateNotifier.notifier).changeColor,
              child: const Text('Change color'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(counterStateNotifier.notifier).incCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

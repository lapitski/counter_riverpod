// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const colors = [Colors.blue, Colors.black, Colors.amber, Colors.purple];

class CounterState {
  int counter = 0;
  int colorIndex = 0;
  CounterState({
    required this.counter,
    required this.colorIndex,
  });

  CounterState copyWith({
    int? counter,
    int? colorIndex,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }
}

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier(super.state);

  incCounter() {
    state = state.copyWith(counter: state.counter + 1);
  }

  changeColor() {
    state = state.copyWith(colorIndex: Random().nextInt(colors.length));
  }
}

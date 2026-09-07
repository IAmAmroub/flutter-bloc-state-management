import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      emit(CounterUpdated(state.countValue + 1));
    });

    on<DecrementCounter>((event, emit) {
      emit(CounterUpdated(state.countValue - 1));
    });
  }
}

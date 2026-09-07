part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int countValue;

  const CounterState(this.countValue);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterUpdated extends CounterState {
  const CounterUpdated(int value) : super(value);
}

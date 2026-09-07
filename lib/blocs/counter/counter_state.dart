part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int countValue;

  const CounterState(this.countValue);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterIncrementSuccess extends CounterState {
  const CounterIncrementSuccess(super.countValue);
}

class CounterDecrementSuccess extends CounterState {
  const CounterDecrementSuccess(super.countValue);
}

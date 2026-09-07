import 'package:bloc_state_management_app/blocs/counter/counter_bloc.dart';
import 'package:bloc_state_management_app/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("BLoC State Management"),
        actions: [
          IconButton(
            onPressed: (() {
              context.read<ThemeBloc>().add(ToggleTheme());
            }),
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.countValue == 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Counter reached 10!'),
                ),
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<CounterBloc, CounterState>(
              builder: ((context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Counter Value',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${state.countValue}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementCounter());
                          },
                          child: const Text("-"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementCounter());
                          },
                          child: const Text("+"),
                        ),
                      ],
                    )
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

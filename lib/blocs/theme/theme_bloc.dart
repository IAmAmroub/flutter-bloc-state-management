import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ToggleTheme>((event, emit) {
      final newThemeMode =
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

      emit(ThemeChanged(newThemeMode));
    });
  }
}

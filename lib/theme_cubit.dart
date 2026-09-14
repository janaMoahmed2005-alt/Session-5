import 'package:flutter_application_1/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: false));

  void toggleTheme() {
    emit(ThemeState(isDark: !state.isDark));
}
}
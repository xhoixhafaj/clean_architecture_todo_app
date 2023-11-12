import 'app_color_scheme.dart';

class ThemeService {
  late AppColorScheme _colorScheme;

  ThemeService(AppColorScheme colorScheme) {
    _colorScheme = colorScheme;
  }

  AppColorScheme get colorScheme => _colorScheme;

  set colorScheme(AppColorScheme value) => _colorScheme = value;
}
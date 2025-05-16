import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(slider: 0.0, password: false);
});

class AppState {
  final double slider;
  final bool password;

  AppState({required this.slider, required this.password});

  AppState copyWith({double? slider, bool? password}) {
    return AppState(slider: slider ?? this.slider, password: password ?? this.password);
  }
}

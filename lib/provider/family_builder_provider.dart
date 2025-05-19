import 'package:riverpod/riverpod.dart';

final multiProvider = StateProvider.family<int, int>((ref, number) {
  return number * 2;
});

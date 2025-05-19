import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
final text = Provider<String>((ref) {
  return 'Usman';
});

final number = Provider<int>((ref) {
  return 24;
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(text);
    final age = ref.watch(number);
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.teal,
        title: Text('Provider'),
        centerTitle: true,
      ),
      body: Center(child: Text("$name $age", style: TextStyle(fontSize: 30))),
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(text);
//     final age = ref.watch(number);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('RiverPod'),
//         centerTitle: true,
//       ),
//       body: Center(child: Text("$name $age", style: TextStyle(fontSize: 30))),
//     );
//   }
// }

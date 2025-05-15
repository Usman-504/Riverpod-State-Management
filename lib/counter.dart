import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///State Provider
final number = StateProvider<int>((ref) {
  return 0;
});

final swithProvider = StateProvider<bool>((ref) {
  return false;
});

class Counter extends ConsumerStatefulWidget {
  const Counter({super.key});

  @override
  ConsumerState<Counter> createState() => _CounterState();
}

class _CounterState extends ConsumerState<Counter> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('RiverPod'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(number);
              print('build2');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(count.toString(), style: TextStyle(fontSize: 30)),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(number.notifier).state++;
                      },
                      child: Text("+", style: TextStyle(fontSize: 30)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(number.notifier).state--;
                      },
                      child: Text("-", style: TextStyle(fontSize: 30)),
                    ),
                  ],
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final toggle = ref.watch(swithProvider);
              print('build3');
              return Switch(
                value: toggle,
                onChanged: (value) {
                  ref.read(swithProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
    );
  
  }
}

// class Counter extends ConsumerWidget {
//   const Counter({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('build1');
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('RiverPod'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Consumer(
//             builder: (context, ref, child) {
//               final count = ref.watch(number);
//               print('build2');
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(count.toString(), style: TextStyle(fontSize: 30)),
//                     ElevatedButton(
//                       onPressed: () {
//                         ref.read(number.notifier).state++;
//                       },
//                       child: Text("+", style: TextStyle(fontSize: 30)),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         ref.read(number.notifier).state--;
//                       },
//                       child: Text("-", style: TextStyle(fontSize: 30)),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final toggle = ref.watch(swithProvider);
//               print('build3');
//               return Switch(
//                 value: toggle,
//                 onChanged: (value) {
//                   ref.read(swithProvider.notifier).state = value;
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/future_provider.dart';

class FutureView extends ConsumerWidget {
  const FutureView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     backgroundColor: Colors.teal,
        title: Text('Future Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(futureProvider);
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(futureProvider);
          return Center(
            child: provider.when(
              skipLoadingOnRefresh: false,
              data: (value) => Center(child: Text(value.toString())),
              error: (error, stact) => Center(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

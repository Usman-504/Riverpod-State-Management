import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/stream_provider.dart';

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.teal,
        title: Text('Stream Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(streamProvider);
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(streamProvider);
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

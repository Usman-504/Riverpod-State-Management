import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/family_builder_provider.dart';

class FamilyBuilderView extends ConsumerWidget {
  const FamilyBuilderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     backgroundColor: Colors.teal,
        title: Text('Family Builder'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final result = ref.watch(multiProvider(20));
          return Center(child: Text(result.toString()));
        },
      ),
    );
  }
}

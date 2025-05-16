import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/item_provider.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('RiverPod'),
        centerTitle: true,
      ),
      body:
          item.isEmpty
              ? Center(child: Text('No Data Found'))
              : ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final itemDetails = item[index];

                  return ListTile(
                    title: Text(itemDetails.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            ref
                                .read(itemProvider.notifier)
                                .updateItem(itemDetails.id, 'Ali');
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(itemProvider.notifier)
                                .removeItem(itemDetails.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('Usman');
        },
      ),
    );
  }
}

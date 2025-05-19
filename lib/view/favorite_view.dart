import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/items_provider.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(itemsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('State Notifier Provider'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(itemsProvider.notifier).favorite(value);
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(value: 'All', child: Text('All')),
                PopupMenuItem(value: 'Favorite', child: Text('Favorite')),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(itemsProvider.notifier).addItem();
        },
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(itemsProvider.notifier).filterdList(value);
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.filteredItems.length,
              itemBuilder: (context, index) {
                final items = filteredList.filteredItems[index];
                return ListTile(
                  title: Text(items.name),
                  trailing: Icon(
                    items.favorite ? Icons.favorite : Icons.favorite_border,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/posts_provider.dart';

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Future Provider'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final postsList = ref.watch(postsProvider);
          return Center(
            child: postsList.when(
              skipLoadingOnRefresh: false,
              data:
                  (data) => Center(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return Card(
                          color: Colors.teal,
                          child: ListTile(
                            title: Text(
                              item.title.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              item.body.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              error: (error, stact) => Center(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

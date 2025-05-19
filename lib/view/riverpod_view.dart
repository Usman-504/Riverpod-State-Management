import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/components/custom_button.dart';
import 'package:riverpod_state_management/view/counter_view.dart';
import 'package:riverpod_state_management/view/family_builder_view.dart';
import 'package:riverpod_state_management/view/favorite_view.dart';
import 'package:riverpod_state_management/view/future_view.dart';
import 'package:riverpod_state_management/view/home_view.dart';
import 'package:riverpod_state_management/view/posts_view.dart';
import 'package:riverpod_state_management/view/search_view.dart';
import 'package:riverpod_state_management/view/slider_view.dart';
import 'package:riverpod_state_management/view/stream_view.dart';
import 'package:riverpod_state_management/view/todo_view.dart';

class RiverpodView extends ConsumerWidget {
  const RiverpodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          'RIverpod State Management',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomButton(
                color: Colors.teal,
                text: 'Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'State Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CounterView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'State Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SliderView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'State Notifier Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TodoView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'State Notifier Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SearchView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'State Notifier Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FavoriteView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'Future Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FutureView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'Future Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PostsView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'Stream Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => StreamView()),
                    ),
              ),
              CustomButton(
                color: Colors.teal,
                text: 'Family Builder Provider',
                onPress:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FamilyBuilderView()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

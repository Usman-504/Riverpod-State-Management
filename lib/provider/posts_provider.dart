import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_state_management/model/posts_model.dart';

final postsProvider = FutureProvider<List<PostsModel>>((ref) async {
  try {
    final reposne = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (reposne.statusCode == 200) {
      final List<dynamic> data = jsonDecode(reposne.body);
      List<PostsModel> postsList = data.map((e) => PostsModel.fromJson(e)).toList();
      return postsList;
    } else {
      throw 'Something went wrong';
    }
  } catch (e) {
    rethrow;
  }
});

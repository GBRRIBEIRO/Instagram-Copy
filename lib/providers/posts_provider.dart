import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';

import '../models/post.dart';
import '../models/user_base.dart';

// List<Post> postList = [];

// var posts = USERS.map((user) {
//   if (user.posts != null) {
//     postList.addAll(user.posts as Iterable<Post>);
//   }
// });

// var postsProvider = Provider((ref) => postList.sort((postOne, postTwo) =>
//     postOne.publishDate.compareTo(postTwo.publishDate)) as List<Post>);

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]);

  @override
  set state(List<Post> value) {
    List<User> usersWithPosts = USERS.where((u) => u.posts != null).toList();
    List<Post> posts = [];
    usersWithPosts.map(
      (u) {
        Iterable<Post> pst = u.posts as Iterable<Post>;
        posts.addAll(pst);
      },
    ).toList();
    if (posts.length > 1) {
      posts.sort((u1, u2) => u1.publishDate.compareTo(u2.publishDate));
    }
    super.state = posts;
  }

  List<Post> getOrdenedPosts() {
    List<User> usersWithPosts = USERS.where((u) => u.posts != null).toList();
    List<Post> posts = [];
    usersWithPosts.map(
      (u) {
        Iterable<Post> pst = u.posts as Iterable<Post>;
        posts.addAll(pst);
      },
    ).toList();
    if (posts.length > 1) {
      posts.sort((u1, u2) => u1.publishDate.compareTo(u2.publishDate));
    }
    return posts;
  }

  List<User> getUserWithPosts() {
    return USERS.where((u) => u.posts != null).toList();
  }
}

//To connect the provider to the notifier use this:
//<"NOTIFIER", "DATA BEEING MANAGED">
final postsProvider = StateNotifierProvider<PostNotifier, List<Post>>(
  (ref) {
    return PostNotifier();
  },
);

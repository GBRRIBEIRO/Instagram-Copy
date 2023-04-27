import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

import '../models/post.dart';
import '../models/user_base.dart';

final orderedPostsProvider = Provider(
  (ref) {
    List<Post> posts = [];
    List<User> friendsWithPosts = ref
        .watch(mainUserProvider)
        .friends
        .where((frien) => frien.posts != null)
        .toList();

    friendsWithPosts.forEach((friend) {
      posts.addAll(friend.posts as Iterable<Post>);
    });

    posts.sort(
      (a, b) => b.publishDate.compareTo(a.publishDate),
    );

    return posts;
  },
);

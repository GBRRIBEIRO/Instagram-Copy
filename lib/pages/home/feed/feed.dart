import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/feed/post_widget.dart';
import 'package:instagram_copy/pages/home/stories/stories_bar.dart';
import 'package:instagram_copy/providers/posts_provider.dart';

import '../../../data/dummy_users.dart';

class Feed extends ConsumerStatefulWidget {
  Feed({
    super.key,
  });

  @override
  ConsumerState<Feed> createState() => _FeedState();
}

class _FeedState extends ConsumerState<Feed> {
  @override
  Widget build(BuildContext context) {
    var posts = ref.watch(orderedPostsProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoriesBar(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: posts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: PostWidget(post: posts[index]),
                );
              }),
        ],
      ),
    );
  }
}

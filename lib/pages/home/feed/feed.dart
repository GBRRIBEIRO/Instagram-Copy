import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/feed/post_widget.dart';
import 'package:instagram_copy/pages/home/stories/stories_bar.dart';
import 'package:instagram_copy/providers/posts_provider.dart';

import '../../../data/dummy_users.dart';

class Feed extends ConsumerStatefulWidget {
  const Feed({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;
  @override
  ConsumerState<Feed> createState() => _FeedState();
}

class _FeedState extends ConsumerState<Feed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var posts = ref.read(postsProvider.notifier).getOrdenedPosts();
    //print(posts);
    return SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length + 1,
          itemBuilder: (ctx, index) {
            if (index != null && index == 0) {
              return SizedBox(
                height: widget.constraints.maxHeight * 0.15,
                child: StoriesBar(),
              );
            }

            return Container(
              width: widget.constraints.maxWidth,
              height: widget.constraints.maxHeight * 0.85,
              child: PostWidget(
                constraintBasedHeight: widget.constraints.maxHeight * 0.85,
                constraintBasedWidth: widget.constraints.maxWidth,
                post: posts[index - 1],
              ),
            );
          }),
    );
  }
}

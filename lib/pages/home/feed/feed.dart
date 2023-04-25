import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/feed/post_widget.dart';
import 'package:instagram_copy/pages/home/stories/stories_bar.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return SizedBox(
              height: widget.constraints.maxHeight * 0.15,
              child: StoriesBar(),
            );
          }
          return SizedBox(
            width: widget.constraints.maxWidth,
            height: widget.constraints.maxHeight * 0.85,
            child: PostWidget(
              constraintBasedHeight: widget.constraints.maxHeight * 0.85,
              constraintBasedWidth: widget.constraints.maxWidth,
            ),
          );
        });
  }
}

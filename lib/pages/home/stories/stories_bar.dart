import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';

class StoriesBar extends StatefulWidget {
  const StoriesBar({super.key});

  @override
  State<StoriesBar> createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: constraints.maxHeight * 0.15,
        width: constraints.maxWidth,
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((ctx, index) => StoryAvatar(isRead: true))),
      );
    });
  }
}

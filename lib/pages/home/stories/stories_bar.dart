import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';
import 'package:instagram_copy/providers/stories_provider.dart';
import 'package:instagram_copy/providers/users_provider.dart';

import '../../../models/user_base.dart';

class StoriesBar extends ConsumerStatefulWidget {
  StoriesBar({super.key});

  @override
  ConsumerState<StoriesBar> createState() => _StoriesBarState();
}

class _StoriesBarState extends ConsumerState<StoriesBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<User> userWithStories =
        ref.read(storiesNotifierProvider.notifier).getUserWithStories();
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ListView.builder(
          itemCount: userWithStories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((ctx, index) {
            for (var userStory in userWithStories) {
              return StoryAvatar(
                isRead: false,
                user: userStory,
              );
            }
          })),
    );
  }
}

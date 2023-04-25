import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';
import 'package:instagram_copy/providers/users_provider.dart';

import '../../../models/user_base.dart';

class StoriesBar extends ConsumerStatefulWidget {
  const StoriesBar({super.key});

  @override
  ConsumerState<StoriesBar> createState() => _StoriesBarState();
}

class _StoriesBarState extends ConsumerState<StoriesBar> {
  @override
  Widget build(BuildContext context) {
    var users = ref.watch(usersProvider);
    var userStories = users.where((e) => e.stories != null).toList();

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ListView.builder(
          itemCount: userStories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((ctx, index) {
            for (var userStory in userStories) {
              return StoryAvatar(
                isRead: false,
                user: userStory,
              );
            }
          })),
    );
  }
}

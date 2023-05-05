import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/stories/stories_page/stories_page.dart';
import 'package:instagram_copy/providers/stories_provider.dart';

import '../../../models/user_base.dart';
import 'story_avatar.dart';
import 'story_page/story_page.dart';

class Stories extends ConsumerStatefulWidget {
  Stories({super.key});

  @override
  ConsumerState<Stories> createState() => _StoriesState();
}

class _StoriesState extends ConsumerState<Stories> {
  late List<User> friendWithStoriesAvailable;

  @override
  void initState() {
    super.initState();
    friendWithStoriesAvailable =
        ref.read(storiesNotifierProvider.notifier).getFriendWithStories();
  }

  bool isAllTheStoriesSeen(User user) {
    return user.stories!.every((story) => story.isRead == true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: friendWithStoriesAvailable.length,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((ctx, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => StoriesPage(
                    users: friendWithStoriesAvailable, actualIndex: index),
              )),
              child: StoryAvatar(
                isRead: isAllTheStoriesSeen(friendWithStoriesAvailable[index]),
                image: friendWithStoriesAvailable[index].image,
              ),
            );
          })),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/my_story.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_page.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';
import 'package:instagram_copy/providers/stories_provider.dart';

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
    List<Story> orderedStories = ref.watch(storiesNotifierProvider);
    //print(ref.read(storiesNotifierProvider.notifier).getOrderedStories());
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: MyStory(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: orderedStories.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((ctx, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          StoryPage(userTag: orderedStories[index].userTag),
                    )),
                    child: StoryAvatar(
                      isRead: orderedStories[index]
                          .whoSawTag
                          .contains(ref.read(mainUserProvider).tag),
                      image: orderedStories[index].userImage,
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/my_story.dart';
import 'package:instagram_copy/pages/home/stories/stories.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyStory(),
          Stories(),
        ],
      ),
    );
  }
}

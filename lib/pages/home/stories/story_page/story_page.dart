import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_title.dart';
import 'package:instagram_copy/pages/home/stories/story_page/user_image.dart';
import 'package:instagram_copy/providers/all_users_provider.dart';
import 'package:instagram_copy/providers/users_provider.dart';

import '../../../../models/user_base.dart';

class StoryPage extends ConsumerStatefulWidget {
  StoryPage({super.key, required this.userTag});

  String userTag;
  List<Story>? stories = [];

  @override
  ConsumerState<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends ConsumerState<StoryPage> {
  User user = User('', 'name', 'tag', Image.network('src'), 'biography');
  @override
  void initState() {
    super.initState();
    user = ref.read(allUsersProvider.notifier).getUserByTag(widget.userTag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(7),
        child: Stack(
          children: [
            StoryTitle(
              user: user,
            ),
          ],
        ),
      )),
    );
  }
}

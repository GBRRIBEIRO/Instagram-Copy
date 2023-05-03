import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_image_viewer.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_title.dart';
import 'package:instagram_copy/pages/home/stories/story_page/timed_box.dart';
import 'package:instagram_copy/pages/home/stories/story_page/user_image.dart';
import 'package:instagram_copy/providers/all_users_provider.dart';
import 'package:instagram_copy/providers/stories_provider.dart';
import 'package:instagram_copy/providers/users_provider.dart';

import '../../../../models/user_base.dart';

class StoryPage extends ConsumerStatefulWidget {
  StoryPage({super.key, required this.user});

  User user;
  List<Story>? stories = [];
  int counter = 0;

  @override
  ConsumerState<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends ConsumerState<StoryPage> {
  PageController pageController = PageController();
  double widthFactorForBox = 0;
  int currentMediaIndex = 0;

  void goToNextUserStory(int index) {
    pageController.animateToPage(index + 1,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void goToNextMedia() {
    setState(() {
      currentMediaIndex++;
    });
  }

  void goToPreviousMedia() {
    setState(() {
      currentMediaIndex--;
    });
  }

  List<Story> orderStories(User user) {
    var list = user.stories;
    list!.sort(
      (a, b) => b.postTime.compareTo(a.postTime),
    );
    return list;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Story> stories = orderStories(widget.user);

    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(7),
                  child: Stack(
                    children: [
                      StoryImageViewer(
                        media: stories[currentMediaIndex].media,
                        onNextPress: goToNextMedia,
                        onPreviousPress: goToPreviousMedia,
                      ),
                      Column(
                        children: [
                          TimedBox(
                              range: stories.length,
                              currentIndex: currentMediaIndex),
                          StoryTitle(
                            widthFactorForBox: widthFactorForBox,
                            user: widget.user,
                            index: index,
                            range: stories.length,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}

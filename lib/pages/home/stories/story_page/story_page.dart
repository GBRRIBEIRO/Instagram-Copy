import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_image.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_title.dart';
import 'package:instagram_copy/pages/home/stories/story_page/timing_bar.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';
import 'package:instagram_copy/providers/stories_provider.dart';

import '../../../../models/user_base.dart';

class StoryPage extends ConsumerStatefulWidget {
  StoryPage({
    super.key,
    required this.user,
    required this.goToNextUserStory,
    required this.goToPreviousUserStory,
    this.isReturning = false,
  });
  final Function() goToNextUserStory;
  final Function() goToPreviousUserStory;
  bool isReturning;

  User user;

  @override
  ConsumerState<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends ConsumerState<StoryPage> {
  late PageController pageController;
  int indx = 0;
  double widthFactor = 0;
  int counter = 0;

  List<Story> stories = [];

  void timerControl(int seconds, {bool isOff = false}) {
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (mounted) {
        if (!isOff) {
          if (counter <= (seconds * 1000)) {
            setState(() {
              counter += 20;
              widthFactor = counter / (seconds * 1000);
            });
          } else {
            timer.cancel();
            onNextPress();
          }
        }
      }
      if (isOff) {
        counter = 0;
        widthFactor = 0;
        timer.cancel();
      }
    });
  }

  List<Story> orderStories(User user) {
    var list = user.stories;
    list!.sort(
      (a, b) => b.postTime.compareTo(a.postTime),
    );
    return list;
  }

  void onNextPress() {
    timerControl(0, isOff: true);
    if (indx + 2 > stories.length) {
      widget.goToNextUserStory();
    }
    ref.read(storiesNotifierProvider.notifier).setStory(stories[indx]);

    pageController.nextPage(
        curve: Curves.easeInOut, duration: const Duration(milliseconds: 100));
  }

  void onPreviousPress() {
    timerControl(0, isOff: true);
    if (indx == 0) {
      widget.goToPreviousUserStory();
    }

    pageController.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    stories = orderStories(widget.user);
    if (widget.isReturning) {
      pageController = PageController(initialPage: stories.length - 1);
    } else {
      pageController = PageController();
    }
  }

  @override
  void dispose() {
    timerControl(0, isOff: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(7),
          child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                indx = index;

                return Stack(
                  children: [
                    StoryImage(
                      onNextPress: onNextPress,
                      onPreviousPress: onPreviousPress,
                      story: stories[index],
                    ),
                    Column(
                      children: [
                        Row(
                            children: List.generate(stories.length, (i) {
                          if (i == index) {
                            if (counter == 0) {
                              stories[index].isRead = true;

                              timerControl(
                                stories[index].durationSeconds,
                              );
                            }
                            if (counter >
                                (stories[index].durationSeconds * 1000)) {
                              timerControl(
                                stories[index].durationSeconds,
                                isOff: true,
                              );
                            }
                            return TimingBar(widthFactor: widthFactor);
                          }

                          if (i < index) {
                            return TimingBar(widthFactor: 1);
                          } else {
                            return TimingBar(widthFactor: 0);
                          }
                        })),
                        StoryTitle(
                          user: widget.user,
                        )
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_page.dart';

import '../../../../models/user_base.dart';

class StoriesPage extends StatefulWidget {
  StoriesPage({
    super.key,
    required this.users,
    required this.actualIndex,
  });

  final int actualIndex;
  final List<User> users;

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  late PageController pageController;
  int indexOfContext = 0;
  bool isReturning = false;

  void goToNextPage() {
    if (indexOfContext >= widget.users.length - 1) {
      Navigator.of(context).pop();
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void goToPreviousPage() {
    if (indexOfContext == 0) {
      Navigator.of(context).pop();
    }

    if (pageController.hasClients) {
      isReturning = true;
      pageController.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: widget.actualIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView.builder(
            itemCount: widget.users.length,
            controller: pageController,
            itemBuilder: (ctx, index) {
              indexOfContext = index;
              return StoryPage(
                user: widget.users[index],
                isReturning: isReturning,
                goToNextUserStory: goToNextPage,
                goToPreviousUserStory: goToPreviousPage,
              );
            }));
  }
}

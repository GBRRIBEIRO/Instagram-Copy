import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/main_user.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';
import 'package:instagram_copy/pages/home/stories/story_page/story_page.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

class MyStory extends ConsumerStatefulWidget {
  const MyStory({super.key});

  @override
  ConsumerState<MyStory> createState() => _MyStoryState();
}

class _MyStoryState extends ConsumerState<MyStory> {
  @override
  Widget build(BuildContext context) {
    MainUser mainUser = ref.watch(mainUserProvider);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryPage(userTag: mainUser.tag),
        ));
      },
      child: Stack(children: [
        StoryAvatar(isRead: false, image: mainUser.image),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: Icon(
                    size: 18,
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}

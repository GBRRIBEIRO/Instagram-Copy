import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

import '../data/dummy_users.dart';
import '../models/main_user.dart';
import '../models/story.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  StoriesNotifier(stories) : super([]) {
    state = stories;
  }
}

final storiesNotifierProvider =
    StateNotifierProvider<StoriesNotifier, List<Story>>(
  (ref) {
    MainUser mainUser = ref.read(mainUserProvider);
    List<User> friends = mainUser.friends;
    List<Story> stories = [];
    List<Story> storiesThatISaw = [];
    List<Story> returnStories = [];

    friends = friends.where((friend) => friend.stories != null).toList();
    friends.forEach((friend) {
      stories.addAll(friend.stories as Iterable<Story>);
    });
    if (stories.length > 1) {
      stories.sort((a, b) {
        if (a.whoSawTag.contains(mainUser.tag) &&
            !b.whoSawTag.contains(mainUser.tag)) {
          return 1;
        } else {
          return 0;
        }
      });
    }
    // storiesThatISaw.addAll(
    //     stories.where((story) => story.whoSawTag.contains(mainUser.tag)));

    return StoriesNotifier(stories);
  },
);

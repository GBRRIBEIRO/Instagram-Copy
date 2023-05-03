import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

import '../data/dummy_users.dart';
import '../models/main_user.dart';
import '../models/story.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  StoriesNotifier(StateNotifierProviderRef ref) : super([]) {
    MainUser mainUser = ref.read(mainUserProvider);
    friends = mainUser.friends;
    // MainUser mainUser = ref.read(mainUserProvider);
    // List<User> friends = mainUser.friends;
    // List<Story> stories = [];
    // List<Story> storiesThatISaw = [];
    // List<Story> returnStories = [];

    // friends = friends.where((friend) => friend.stories != null).toList();
    // friends.forEach((friend) {
    //   stories.addAll(friend.stories as Iterable<Story>);
    // });
    // if (stories.length > 1) {
    //   stories.sort((a, b) {
    //     if (a.whoSawTag.contains(mainUser.tag) &&
    //         !b.whoSawTag.contains(mainUser.tag)) {
    //       return 1;
    //     } else {
    //       return 0;
    //     }
    //   });
  }
  late List<User> friends;
  List<User> getFriendWithStories() {
    //Return a list of friend wich have available stories
    return friends.where((friend) => friend.stories != null).toList();
  }
}

final storiesNotifierProvider =
    StateNotifierProvider<StoriesNotifier, List<Story>>(
  (ref) {
    return StoriesNotifier(ref);
  },
);

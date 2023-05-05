import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

import '../data/dummy_users.dart';
import '../models/main_user.dart';
import '../models/story.dart';

class StoriesNotifier extends StateNotifier<List<Story>> {
  StoriesNotifier(StateNotifierProviderRef reff) : super([]) {
    MainUser mainUser = reff.read(mainUserProvider);
    friends = mainUser.friends;
    ref = reff;
  }
  late StateNotifierProviderRef ref;
  late List<Story> allStories;
  late List<User> friends;

  Story getStoryById(String id) {
    List<Story> stories = getAllStories();
    return stories.firstWhere((st) => st.id == id);
  }

  void setStory(Story story) {
    state = state.map((e) {
      if (e.id == story.id) {
        e = story;
        return e;
      } else {
        return e;
      }
    }).toList();
  }

  List<Story> getAllStories() {
    List<User> users = getFriendWithStories();
    List<Story> stories = [];

    users.forEach((user) {
      stories.addAll(user.stories as List<Story>);
    });
    return stories;
  }

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

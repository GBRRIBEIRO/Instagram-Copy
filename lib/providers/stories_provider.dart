import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/models/user_base.dart';

import '../data/dummy_users.dart';

class StoriesNotifier extends StateNotifier<List<User>> {
  StoriesNotifier() : super([]);

  @override
  set state(List<User> value) {
    super.state = USERS.where((user) => user.stories != null).toList();
  }

  List<User> getUserWithStories() {
    return USERS.where((user) => user.stories != null).toList();
  }
}

final storiesNotifierProvider =
    StateNotifierProvider<StoriesNotifier, List<User>>(
  (ref) => StoriesNotifier(),
);

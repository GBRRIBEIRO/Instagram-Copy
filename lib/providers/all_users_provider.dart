import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/providers/main_user_provider.dart';

class AllUsersNotifier extends StateNotifier<List<User>> {
  AllUsersNotifier(List<User> users) : super(users);

  User getUserByTag(String tag) {
    return state.firstWhere((user) => user.tag == tag);
  }
}

final allUsersProvider =
    StateNotifierProvider<AllUsersNotifier, List<User>>((ref) {
  var mainUser = ref.read(mainUserProvider);
  User mUser = User(mainUser.id, mainUser.name, mainUser.tag, mainUser.image,
      mainUser.biography);
  List<User> users = USERS;
  users.add(mUser);
  return AllUsersNotifier(users);
});

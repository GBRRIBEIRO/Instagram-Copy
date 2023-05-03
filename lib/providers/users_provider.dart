import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/models/user_base.dart';

class UsersNotifier extends StateNotifier<List<User>> {
  UsersNotifier() : super(USERS);
}

final usersProvider = StateNotifierProvider<UsersNotifier, List<User>>((ref) {
  return UsersNotifier();
});

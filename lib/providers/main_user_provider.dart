import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:uuid/uuid.dart';

import '../models/main_user.dart';

class MainUserNotifier extends StateNotifier<MainUser> {
  MainUserNotifier()
      : super(MainUser(
          Uuid.NAMESPACE_OID,
          'Gabriel Ribeiro',
          'gbr_ribeiro',
          Image.network(
            'https://portalpopline.com.br/wp-content/uploads/2023/03/gekko-novo-agente-los-angeles-valorant.jpg',
            fit: BoxFit.cover,
          ),
          'Literally a gekko main',
          friends: USERS,
        ));
}

final mainUserProvider =
    StateNotifierProvider<MainUserNotifier, MainUser>((ref) {
  return MainUserNotifier();
});

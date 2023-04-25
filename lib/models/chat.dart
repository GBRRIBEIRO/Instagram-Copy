import 'package:instagram_copy/models/user_base.dart';

class Chat {
  final UserBase user;
  final bool isUnread;

  Chat(this.user, this.isUnread);
}

import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/models/user_base.dart';

import 'chat.dart';

class MainUser extends User {
  List<Story> userStories;

  List<User> friends;
  List<Post> feed;
  List<Chat> chats;

  MainUser(
    super.id,
    super.name,
    super.tag,
    super.imageUrl,
    super.biography, {
    this.userStories = const [],
    this.friends = const [],
    this.feed = const [],
    this.chats = const [],
  });
}

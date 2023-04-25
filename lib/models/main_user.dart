import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/models/user_base.dart';

import 'chat.dart';

class MainUser extends UserBase {
  List<Story> userStories;

  List<UserBase> friends;
  List<Post> feed;
  List<Story> stories;
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
    this.stories = const [],
  });
}

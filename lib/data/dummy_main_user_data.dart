import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/models/main_user.dart';
import 'package:uuid/uuid.dart';

MainUser MAIN_USER = MainUser(
  Uuid().toString(),
  'Joe Doe',
  'joe_doe',
  'https://image-cdn.essentiallysports.com/wp-content/uploads/call-of-duty-modern-warfare-II-ghost-image-1-1110x1065.jpg',
  'I\'m a ghost',
  friends: USERS,
);

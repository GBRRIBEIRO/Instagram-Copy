import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/feed/post_avatar.dart';

import '../../../data/dummy_users.dart';
import '../../../models/post.dart';
import '../../../models/user_base.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({super.key, required this.post});

  final Post post;

  User getPostUser(String tag) {
    var user = USERS.where((user) => user.tag == tag).toList();
    return user[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.2,
            color: Theme.of(context).colorScheme.background,
          ),
          bottom: BorderSide(
            width: 0.2,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                child:
                    PostAvatar(isRead: false, user: getPostUser(post.userTag)),
              ),
              Text(
                post.userTag,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            color: Theme.of(context).colorScheme.onSurface,
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

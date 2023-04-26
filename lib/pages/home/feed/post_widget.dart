import 'package:flutter/material.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/pages/home/feed/all_comments_text.dart';
import 'package:instagram_copy/pages/home/feed/liked_by_text.dart';
import 'package:instagram_copy/pages/home/feed/post_avatar.dart';
import 'package:instagram_copy/pages/home/feed/subtitle_text.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';

class PostWidget extends StatefulWidget {
  const PostWidget(
      {super.key,
      required this.constraintBasedHeight,
      required this.constraintBasedWidth,
      required this.post});

  final double constraintBasedHeight;
  final double constraintBasedWidth;
  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  User getPostUser(String tag) {
    var user = USERS.where((user) => user.tag == tag).toList();
    return user[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.constraintBasedHeight,
        width: widget.constraintBasedWidth,
        child: LayoutBuilder(builder: (ctx, constraints) {
          return Container(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.1,
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
                            width: constraints.maxHeight * 0.07,
                            height: constraints.maxHeight * 0.07,
                            child: PostAvatar(
                                isRead: false,
                                user: getPostUser(widget.post.userTag)),
                          ),
                          Text(
                            widget.post.userTag,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                      width: 0.1,
                    ),
                  )),
                  width: double.infinity,
                  height: constraints.maxHeight * 0.60,
                  child: Image.network(
                    widget.post.mediaUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 33,
                                  icon: Icon(Icons.favorite_outline),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 30,
                                  icon: Icon(
                                    Icons.chat_bubble_outline,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 30,
                                  icon: Icon(
                                    Icons.send_sharp,
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                iconSize: 33,
                                icon: const Icon(Icons.bookmark_outline))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.post.likes == null
                                  ? const LikedByText(
                                      likedBy: 0,
                                    )
                                  : LikedByText(
                                      likedBy: widget.post.likes!,
                                    ),
                              widget.post.subtitle == null
                                  ? Container()
                                  : SizedBox(
                                      width: constraints.maxWidth,
                                      child: SubtitleText(
                                        userTag: widget.post.userTag,
                                        subtitle: widget.post.subtitle!,
                                        maxConstraintWidth:
                                            constraints.maxWidth,
                                      ),
                                    ),
                              widget.post.comments == null
                                  ? Container()
                                  : AllCommentsText(
                                      quantityOfComments:
                                          widget.post.comments!.length)
                            ],
                          ),
                        )
                      ]),
                )
              ],
            ),
          );
        }));
  }
}

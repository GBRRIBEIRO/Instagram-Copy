import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/data/dummy_users.dart';
import 'package:instagram_copy/models/post.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:instagram_copy/pages/home/feed/all_comments_text.dart';
import 'package:instagram_copy/pages/home/feed/liked_by_text.dart';
import 'package:instagram_copy/pages/home/feed/post_avatar.dart';
import 'package:instagram_copy/pages/home/feed/post_image.dart';
import 'package:instagram_copy/pages/home/feed/post_title.dart';
import 'package:instagram_copy/pages/home/feed/subtitle_text.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';

class PostWidget extends ConsumerStatefulWidget {
  const PostWidget({super.key, required this.post});
  final Post post;

  @override
  ConsumerState<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget> {
  var mHeight;
  var mWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          child: PostTitle(post: widget.post),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PostImage(mediaUrl: widget.post.mediaUrl),
        ),
        SizedBox(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 33,
                      color: Theme.of(context).colorScheme.onSurface,
                      icon: Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      color: Theme.of(context).colorScheme.onSurface,
                      icon: Icon(
                        Icons.chat_bubble_outline,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 30,
                      color: Theme.of(context).colorScheme.onSurface,
                      icon: Icon(
                        Icons.send_sharp,
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    color: Theme.of(context).colorScheme.onSurface,
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
                          child: SubtitleText(
                            userTag: widget.post.userTag,
                            subtitle: widget.post.subtitle!,
                            maxConstraintWidth: double.infinity,
                          ),
                        ),
                  widget.post.comments == null
                      ? Container()
                      : AllCommentsText(
                          quantityOfComments: widget.post.comments!.length)
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/feed/all_comments_text.dart';
import 'package:instagram_copy/pages/home/feed/liked_by_text.dart';
import 'package:instagram_copy/pages/home/stories/story_avatar.dart';

class PostWidget extends StatefulWidget {
  const PostWidget(
      {super.key,
      required this.constraintBasedHeight,
      required this.constraintBasedWidth});

  final double constraintBasedHeight;
  final double constraintBasedWidth;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
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
                          //StoryAvatar(isRead: true),
                          const Text(
                            'Tag',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.60,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbvuLruADwP85XloHkjzEoqu0ZJfShMWhlcA&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
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
                              LikedByText(
                                likedBy: [],
                              ),
                              Text('Subtitle'),
                              AllCommentsText(quantityOfComments: 100)
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/stories/story_page/timed_box.dart';
import 'package:instagram_copy/pages/home/stories/story_page/user_image.dart';

import '../../../../models/user_base.dart';

class StoryTitle extends StatefulWidget {
  StoryTitle(
      {super.key,
      required this.user,
      required this.index,
      required this.range,
      required this.widthFactorForBox});

  double widthFactorForBox;
  final int index;
  final int range;
  final User user;

  @override
  State<StoryTitle> createState() => _StoryTitleState();
}

class _StoryTitleState extends State<StoryTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserImage(widget.user.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.user.tag,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Text('23 h',
                      style: const TextStyle(
                        color: Colors.grey,
                      ))
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}

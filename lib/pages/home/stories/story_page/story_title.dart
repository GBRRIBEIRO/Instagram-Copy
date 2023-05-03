import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/stories/story_page/user_image.dart';

import '../../../../models/user_base.dart';

class StoryTitle extends StatelessWidget {
  StoryTitle({super.key, required this.user});

  final User user;

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
                  UserImage(user.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      user.tag,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Text('23 h',
                      style: TextStyle(
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagram_copy/models/story.dart';

class StoryImage extends StatelessWidget {
  StoryImage(
      {super.key,
      required this.story,
      required this.onNextPress,
      required this.onPreviousPress});
  Story story;
  final Function() onNextPress;
  final Function() onPreviousPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        story.media,
        Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => onPreviousPress(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => onNextPress(),
              ),
            ),
          ),
        ])
      ],
    );
  }
}

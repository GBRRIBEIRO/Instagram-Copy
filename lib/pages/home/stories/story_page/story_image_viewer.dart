import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/providers/story_timer_provider.dart';

class StoryImageViewer extends ConsumerStatefulWidget {
  StoryImageViewer(
      {super.key,
      required this.media,
      required this.onNextPress,
      required this.onPreviousPress});
  Image media;
  final Function() onNextPress;
  final Function() onPreviousPress;

  @override
  ConsumerState<StoryImageViewer> createState() => StoryImageViewerState();
}

class StoryImageViewerState extends ConsumerState<StoryImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.media,
        ),
        Row(
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () => widget.onPreviousPress(), //Previous button
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                onTap: () => widget.onNextPress(), //Next button
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

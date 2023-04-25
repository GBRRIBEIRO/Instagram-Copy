import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/stories/image_container.dart';

import '../../../models/user_base.dart';

class StoryAvatar extends StatefulWidget {
  StoryAvatar({
    super.key,
    required this.isRead,
    required this.user,
  });

  bool isRead;
  final User user;

  @override
  State<StoryAvatar> createState() => _StoryAvatarState();
}

class _StoryAvatarState extends State<StoryAvatar> {
  var gradientColor = const LinearGradient(
    colors: [
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.pink,
      Colors.purple
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  var transparentGradientColor = const LinearGradient(
    colors: [Colors.transparent, Colors.transparent],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: !widget.isRead ? gradientColor : transparentGradientColor,
        ),
        width: constraints.maxHeight,
        height: constraints.maxHeight,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.3,
            ),
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: ImageContainer(
            url: widget.user.imageUrl,
          ),
        ),
      );
    });
  }
}

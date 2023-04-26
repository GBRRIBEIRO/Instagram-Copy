import 'package:flutter/material.dart';
import 'package:instagram_copy/pages/home/stories/image_container.dart';

import '../../../models/user_base.dart';

class PostAvatar extends StatefulWidget {
  PostAvatar({
    super.key,
    required this.isRead,
    required this.user,
  });

  bool isRead;
  final User user;

  @override
  State<PostAvatar> createState() => _PostAvatarState();
}

class _PostAvatarState extends State<PostAvatar> {
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return !widget.isRead
          ? Container(
              margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, gradient: gradientColor),
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
            )
          : Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0.3,
                ),
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: ImageContainer(
                url: widget.user.imageUrl,
              ),
            );
    });
  }
}

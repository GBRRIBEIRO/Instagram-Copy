import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PostImage extends StatefulWidget {
  const PostImage({super.key, required this.mediaUrl});

  final String mediaUrl;

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  bool isLandscaped(String url) {
    var h = 0;
    var w = 0;

    Image.network(
      url,
    ).image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          h = info.image.height;
          w = info.image.width;
        });
      }),
    );

    if (w > h) {
      print("no if");
      return true;
    } else {
      print("no else");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 0.1,
          ),
        )),
        width: double.infinity,
        child: isLandscaped(widget.mediaUrl)
            ? Image.network(
                widget.mediaUrl,
                fit: BoxFit.cover,
              )
            : Image.network(
                widget.mediaUrl,
                fit: BoxFit.contain,
              ));
  }
}

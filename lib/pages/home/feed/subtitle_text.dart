import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required this.userTag,
    required this.subtitle,
    required this.maxConstraintWidth,
  });

  final String userTag;
  final String subtitle;
  final double maxConstraintWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$userTag: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextSpan(
                  text: subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

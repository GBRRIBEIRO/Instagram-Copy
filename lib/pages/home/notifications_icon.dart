import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon(this.isAnyNotifications, {super.key});

  final bool isAnyNotifications;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          color: Theme.of(context).colorScheme.onSurface,
          icon: const Icon(Icons.favorite_outline_sharp),
          iconSize: 30,
        ),
        isAnyNotifications
            ? Positioned(
                top: 5,
                right: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 12,
                  height: 12,
                ),
              )
            : Container()
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon(this.numberOfMessages, {super.key});

  final int numberOfMessages;

  @override
  Widget build(BuildContext context) {
    final String messageString;
    if (numberOfMessages > 99) {
      messageString = '99+';
    } else {
      messageString = numberOfMessages.toString();
    }

    return Stack(
      children: [
        Transform.rotate(
          angle: -0.785398,
          child: IconButton(
            onPressed: () {},
            color: Theme.of(context).colorScheme.onSurface,
            icon: const Icon(Icons.send),
            iconSize: 30,
          ),
        ),
        numberOfMessages > 0
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        messageString,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                ))
            : Container()
      ],
    );
  }
}

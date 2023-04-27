import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_copy/pages/home/feed/feed.dart';
import 'package:instagram_copy/pages/home/feed/post_widget.dart';
import 'package:instagram_copy/pages/home/message_icon.dart';
import 'package:instagram_copy/pages/home/notifications_icon.dart';
import 'package:instagram_copy/pages/home/stories/stories_bar.dart';
import 'package:instagram_copy/pages/home/title.dart';

class HomePage extends ConsumerWidget {
  const HomePage(this.goDm, {super.key});

  final Function() goDm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                const AppTitle(),
                DropdownButton(
                    items: [],
                    underline: Container(),
                    icon: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onChanged: (changes) {})
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: [
                    const NotificationIcon(false),
                    const MessageIcon(0),
                  ],
                ),
              ),
            ]),
        body: Feed());
  }
}

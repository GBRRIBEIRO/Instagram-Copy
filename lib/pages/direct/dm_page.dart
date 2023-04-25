import 'package:flutter/material.dart';

class DirectMessagePage extends StatefulWidget {
  const DirectMessagePage(this.goHome, {super.key});

  final Function() goHome;

  @override
  State<DirectMessagePage> createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('gbr_ribeiroo'),
            DropdownButton(
                items: [],
                underline: Container(),
                icon: const Icon(Icons.expand_more, color: Colors.white),
                onChanged: (changes) {})
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => widget.goHome(),
        ),
      ),
    );
  }
}

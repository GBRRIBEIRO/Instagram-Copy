import 'package:flutter/material.dart';

class TimingBar extends StatefulWidget {
  TimingBar({super.key, required this.widthFactor});

  double widthFactor;
  @override
  State<TimingBar> createState() => _TimingBarState();
}

class _TimingBarState extends State<TimingBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height * 0.005,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(children: [
          FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: widget.widthFactor,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

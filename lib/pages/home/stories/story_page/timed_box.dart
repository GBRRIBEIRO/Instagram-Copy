import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimedBox extends ConsumerStatefulWidget {
  TimedBox({super.key, required this.range, required this.currentIndex});

  late double widthFactorForBox;
  int range;
  int currentIndex = 0;
  double widthFactor = 0;

  @override
  ConsumerState<TimedBox> createState() => _TimedBoxState();
}

class _TimedBoxState extends ConsumerState<TimedBox> {
  int counter = 0;

  void _startTimer(int seconds) {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (counter < seconds * 1000) {
        setState(() {
          counter += 50;
          widget.widthFactor = counter / (seconds * 1000);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer(5);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(widget.range, (index) {
      if (index == widget.currentIndex) {
        print(widget.currentIndex);
        print(index);
        //widget.widthFactor = 1;
      } else {
        if (index != 1) {
          widget.widthFactor = 1;
        } else {
          widget.widthFactor = 0;
        }
      }
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
    }));
  }
}

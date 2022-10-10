import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget({super.key, required this.child, required this.controller, required this.duration});

  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    // final pixels = widget.controller.position.pixels;
    // if (pixels >= 200) {
    //   hide();
    // } else if (direction == ScrollDirection.reverse) {
    //   show();
    // }
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 56.0 : 0,
      child: Wrap(
        children: [
          widget.child,
        ],
      ),
    );
  }
}

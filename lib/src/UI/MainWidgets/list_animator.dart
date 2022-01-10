import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimator extends StatefulWidget {
  final List data;
  final Function child;
  final int duration;
  final double verticalOffset;
  final double horizontalOffset;
  final scrollDirection;
  final bool reverse;
  final padding;
  final bool physics;

  const ListAnimator({
    Key key,
    this.data,
    this.duration,
    this.verticalOffset,
    this.horizontalOffset,
    this.child,
    this.scrollDirection,
    this.reverse,
    this.padding,
    this.physics,
  }) : super(key: key);

  @override
  _ListAnimatorState createState() => _ListAnimatorState();
}

class _ListAnimatorState extends State<ListAnimator> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: widget.physics == null
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        padding: widget.padding == null
            ? const EdgeInsets.symmetric(horizontal: 0)
            : const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        itemCount: widget.data == null ? 0 : widget.data.length,
        scrollDirection:
            widget.scrollDirection == null ? Axis.vertical : widget.scrollDirection,
        reverse: widget.reverse ?? false,
        itemBuilder: (_, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: widget.duration ?? 200),
            child: SlideAnimation(
              duration: Duration(milliseconds: widget.duration ?? 200),
              verticalOffset: widget.verticalOffset ?? 50.0,
              horizontalOffset: widget.horizontalOffset ?? 50.0,
              child: FadeInAnimation(
                child: widget.child(index),
              ),
            ),
          );
        },
      ),
    );
  }
}

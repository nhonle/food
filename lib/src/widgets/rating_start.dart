import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/light_color.dart';

class RatingStar extends StatefulWidget {
  RatingStar({Key key, this.rating, this.iconSize}) : super(key: key);
  final double rating;
  final double iconSize;

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {

  Widget _start(int index) {
    bool halfStar = false;
    if ((widget.rating * 2) % 2 != 0) {
      if (index < widget.rating && index == widget.rating - .5) {
        halfStar = true;
      }
    }

    return Icon(halfStar ? Icons.star_half : Icons.star,
        color: index < widget.rating ? LightColor.yellow : LightColor.none, size: widget.iconSize,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end:5),
      duration: Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Wrap(
            children: Iterable.generate(value.toInt(), (index) => _start(index)).toList());
      },
    ),);
  }
}

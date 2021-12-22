import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final double value;
  const Ratings({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < value ? Icons.star : Icons.star_border,
          );
        }));
  }
}

class StarRating extends StatelessWidget {
  final int starCount = 5;
  final double rating;
  final Color? color;

  const StarRating({Key? key, required this.rating, required this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(Icons.star_border, color: color);
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(Icons.star_half, color: color);
    } else {
      icon = new Icon(Icons.star, color: color);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}

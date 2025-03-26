import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.filledColor = AppColors.amber,
    this.unfilledColor = AppColors.gray200,
    this.size = 24,
  });

  final double rating;
  final int starCount;
  final Color filledColor;
  final Color unfilledColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < starCount; i++) {
      if (i < rating.floor()) {
        stars.add(Icon(Icons.star, color: filledColor, size: size));
      } else if (i == rating.floor()) {
        double fillAmount = rating - rating.floor();
        fillAmount = fillAmount.clamp(0.2, 1.0);

        stars.add(
          Stack(
            children: [
              Icon(Icons.star, color: unfilledColor, size: size),
              ClipRect(
                clipper: _StarClipper(fillAmount),
                child: Icon(Icons.star, color: filledColor, size: size),
              ),
            ],
          ),
        );
      } else {
        stars.add(Icon(Icons.star, color: unfilledColor, size: size));
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercentage;

  _StarClipper(this.fillPercentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fillPercentage, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

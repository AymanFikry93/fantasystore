import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import '../../../../core/constants/app_colors.dart';

class RipplesAnimation extends StatefulWidget {
  final String imagePath;

  const RipplesAnimation({super.key, required this.imagePath});

  @override
  RipplesAnimationState createState() => RipplesAnimationState();
}

class RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  double size = 40.0;
  Color color = AppColors.primaryColor.withOpacity(0.6);

  @override
  void initState() {
    super.initState();
    size = 80.h;
    color = AppColors.secondaryColor.withOpacity(0.6);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = 50;
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller!,
          color: color,
        ),
        child: SizedBox(
          width: (size * 2.0).w,
          height: (size * 2.0).h,
          child: _button(),
        ),
      ),
    );
  }

  Widget _button() {
    return Center(
      child: ScaleTransition(
          scale: Tween(begin: 0.98, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller!,
              curve: const PulsateCurve(),
            ),
          ),
          child:
          // Container(
          //   decoration:
          //       BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          //   width: 60.w,
          //   height: 60.h,
          // )
          Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
            width: 60.w,
            height: 60.h,
          )
          ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color color = this.color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class PulsateCurve extends Curve {
  const PulsateCurve();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}

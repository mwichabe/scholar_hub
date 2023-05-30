import 'package:flutter/material.dart';

class AnimatedFigure extends StatefulWidget {
  const AnimatedFigure({Key? key}) : super(key: key);

  @override
  _AnimatedFigureState createState() => _AnimatedFigureState();
}

class _AnimatedFigureState extends State<AnimatedFigure> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: FigurePainter(_animation.value),
          child: child,
        );
      },
      child: const SizedBox(
        width: 90,
        height: 90,
      ),
    );
  }
}

class FigurePainter extends CustomPainter {
  final double animationValue;

  FigurePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Adjust the figure drawing based on the animation value
    final figureWidth = radius * 0.8;
    final figureHeight = radius * 0.6;
    final tilt = animationValue * 0.5;
    final leftX = centerX - (figureWidth / 2);
    final rightX = centerX + (figureWidth / 2);
    final topY = centerY - (figureHeight / 2);
    final bottomY = centerY + (figureHeight / 2);

    final path = Path()
      ..moveTo(leftX, topY)
      ..lineTo(rightX, topY)
      ..lineTo(rightX, bottomY)
      ..lineTo(leftX, bottomY)
      ..close();

    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(tilt);
    canvas.translate(-centerX, -centerY);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

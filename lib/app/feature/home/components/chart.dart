import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key, required this.percent}) : super(key: key);
  final double percent;

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  void iniAnimation() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        Tween<double>(begin: 0, end: widget.percent).animate(controller);
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    iniAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Stack(
              children: [
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      value: animation.value,
                      backgroundColor: AppColors.chartSecondary,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${(animation.value * 100).toInt()}%',
                    style: AppTextStyles.heading,
                  ),
                )
              ],
            );
          },
        ));
  }
}

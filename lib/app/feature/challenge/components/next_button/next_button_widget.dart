import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgoundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({
    required this.label,
    required this.onTap,
  })   : this.backgoundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.darkGreen;

  NextButtonWidget.white({
    required this.label,
    required this.onTap,
  })   : this.backgoundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border;

  NextButtonWidget.purple({
    required this.label,
    required this.onTap,
  })   : this.backgoundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple;

  NextButtonWidget.transparent({
    required this.label,
    required this.onTap,
  })   : this.backgoundColor = Colors.transparent,
        this.fontColor = AppColors.grey,
        this.borderColor = Colors.transparent;

  final String label;
  final Color backgoundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgoundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}

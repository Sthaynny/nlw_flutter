import 'package:dev_quiz/app/shared/models/awnser_model.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final VoidCallback onTap;
  final disabled;

  const AnserWidget({
    required this.awnser,
    required this.onTap,
    Key? key,
    this.isSelected = false,
    this.disabled = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.border,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  awnser.title,
                  style:
                      isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color:
                          isSelected ? _selectedBorderRight : AppColors.border,
                    ),
                  ),
                ),
                child: isSelected
                    ? Icon(
                        _selectedIconRight,
                        color: AppColors.white,
                        size: 16,
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

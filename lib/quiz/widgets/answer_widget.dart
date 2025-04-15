import 'package:flutter/material.dart';
import 'package:quizzz/core/app_colors.dart';
import 'package:quizzz/core/app_text_styles.dart';
import 'package:quizzz/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled; // Se verdadeiro, o botão não pode mais ser pressionado
  final bool showCorrect; // Se verdadeiro, mostra a resposta correta

  const AnswerWidget({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onTap,
    this.disabled = false,
    this.showCorrect = false,
  });

  Color get _selectedColorRight => answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  TextStyle get _selectedTextStyleRight => answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  // Destacar resposta correta mesmo quando não selecionada
  Color get _borderColor {
    if (isSelected) {
      return _selectedBorderRight;
    } else if (showCorrect && answer.isRight) {
      return AppColors.lightGreen;
    } else {
      return AppColors.border;
    }
  }

  Color get _cardColor {
    if (isSelected) {
      return _selectedColorCardRight;
    } else if (showCorrect && answer.isRight) {
      return AppColors.lightGreen;
    } else {
      return Colors.white;
    }
  }

  TextStyle get _textStyle {
    if (isSelected) {
      return _selectedTextStyleRight;
    } else if (showCorrect && answer.isRight) {
      return AppTextStyles.bodyDarkGreen;
    } else {
      return AppTextStyles.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: _borderColor,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                answer.title,
                style: _textStyle,
              ),
            ),
            // Exibir ícone de correto/incorreto para respostas selecionadas
            // ou para destacar a resposta correta após seleção
            if (isSelected || (showCorrect && answer.isRight))
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.darkGreen,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: isSelected ? _selectedBorderRight : AppColors.lightGreen,
                    ),
                  ),
                ),
                child: Icon(
                  isSelected ? (answer.isRight ? Icons.check : Icons.close) : Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class TextExtension {}

extension TextExt on Text {
  Text get label => Text(
        this.data!,
        style: AppTheme.textStyles.label,
      );
}

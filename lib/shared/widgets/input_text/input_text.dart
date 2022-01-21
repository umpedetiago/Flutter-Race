import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:meuapp/shared/theme/app_text.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keybordType;
  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.keybordType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(
          height: 12,
        ),
        TextFormField(
          keyboardType: keybordType,
          inputFormatters: inputFormatters,
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? "");
            }
          },
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
              hintStyle: AppTheme.textStyles.hint,
              hintText: "$hint",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.colors.border,
                  ))),
        ),
      ],
    );
  }
}

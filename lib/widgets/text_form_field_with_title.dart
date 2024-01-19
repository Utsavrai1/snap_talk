import 'package:flutter/material.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? initialValue;
  final String hintText;
  final int? maxLines;
  final bool readOnly;
  final bool? isDense;
  final bool expands;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlignVertical? textAlignVertical;
  final BoxConstraints? constraints;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? textInputType;

  const TextFormFieldWithTitle({
    super.key,
    this.controller,
    this.title,
    this.initialValue,
    required this.hintText,
    this.maxLines = 1,
    this.readOnly = false,
    this.isDense,
    this.expands = false,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlignVertical,
    this.constraints,
    this.validator,
    this.onChanged,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
        if (title != null) const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          expands: expands,
          maxLines: maxLines,
          readOnly: readOnly,
          textAlignVertical: textAlignVertical,
          initialValue: initialValue,
          obscureText: obscureText,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            isDense: isDense,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Color.fromRGBO(136, 151, 174, 1),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            constraints: constraints,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

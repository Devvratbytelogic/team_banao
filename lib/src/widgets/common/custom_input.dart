import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_banao/src/core/constants.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enableToggle;
  final Widget? icon;              // for static icon (when toggle disabled)
  final Widget? toggleOnIcon;     // icon to show when text is visible (not obscured)
  final Widget? toggleOffIcon;    // icon to show when text is obscured

  const CustomInput({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.enableToggle = false,
    this.icon,
    this.toggleOnIcon,
    this.toggleOffIcon,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: theme.inputDecorationTheme.labelStyle,
        border: theme.inputDecorationTheme.border,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        suffixIcon: widget.enableToggle
            ? IconButton(
          icon: _obscureText
              ? (widget.toggleOffIcon ?? const Icon(Icons.visibility_off)) //color: Colors.grey
              : (widget.toggleOnIcon ?? const Icon(Icons.visibility)),
          onPressed: _toggleObscure,
        )
            : widget.icon,
      ),
      style: TextStyle(
        fontSize: 14,          // Your desired font size
        color: AppColors.primary, // Your desired color
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

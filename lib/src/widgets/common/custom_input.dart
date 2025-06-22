import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ Import for inputFormatters
import 'package:team_banao/src/core/constants.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enableToggle;
  final Widget? icon;
  final Widget? toggleOnIcon;
  final Widget? toggleOffIcon;
  final List<TextInputFormatter>? inputFormatters; // ✅ NEW
  final bool enabled; // ✅ NEW

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
    this.inputFormatters, // ✅ NEW
    this.enabled = true, // ✅ Default is enabled

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
      inputFormatters: widget.inputFormatters, // ✅ NEW
      enabled: widget.enabled, // ✅ Use enabled flag here
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: theme.inputDecorationTheme.labelStyle,
        border: theme.inputDecorationTheme.border,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        suffixIcon: widget.enableToggle
            ? IconButton(
          icon: _obscureText
              ? (widget.toggleOffIcon ?? const Icon(Icons.visibility_off))
              : (widget.toggleOnIcon ?? const Icon(Icons.visibility)),
          onPressed: _toggleObscure,
        )
            : widget.icon,
      ),
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.primary,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

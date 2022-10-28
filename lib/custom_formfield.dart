import 'package:flutter/material.dart';

@immutable
class CustomFormField extends StatefulWidget {
  final String labelText;
  bool isPassword;
  final String? Function(String?) validatorFunction;
  final String? Function(String?) onChanged;

  final Color primaryColor;
  final Color textColor;
  CustomFormField({
    super.key,
    required this.labelText,
    required this.isPassword,
    required this.validatorFunction,
    required this.primaryColor,
    required this.textColor,
    required this.onChanged,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //cuz the textfeild's border radius is also the same
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      elevation: 1.5,
      shadowColor: Colors.black.withOpacity(0.8),
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: widget.isPassword,
        validator: widget.validatorFunction,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 16,
          // fontWeight: FontWeight.w400,
        ),
        cursorColor: widget.primaryColor.withOpacity(0.5),
        decoration: InputDecoration(
          suffixIcon: widget.labelText.contains('Password')
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isPassword = !widget.isPassword;
                    });
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(
                      widget.isPassword ? Icons.bar_chart : Icons.abc,
                      color: widget.textColor.withOpacity(0.5),
                      size: 16,
                    ),
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(left: 12, right: 12),
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: widget.textColor.withOpacity(0.5),
              ),
          floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: widget.textColor.withOpacity(0.5),
              ),
          label: Text(
            widget.labelText,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

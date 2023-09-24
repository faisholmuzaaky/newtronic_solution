part of 'widget.dart';

class CustomTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String title;
  final String hintText;
  final bool isPassword;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool isEnable;
  final Function(String)? onChanged;
  final Color? fillColor;
  final bool borderSide;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.width,
    this.height,
    this.title = '',
    this.hintText = '',
    this.prefixIcon,
    this.hintStyle,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.isEnable = true,
    this.onChanged,
    this.fillColor,
    this.borderSide = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      enabled: isEnable,
      validator: validator,
      decoration: InputDecoration(
        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 11.h),
        hintText: hintText,
        hintStyle: hintStyle ??
            fontTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.r),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide:
              borderSide ? BorderSide(color: greyColor) : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide:
              borderSide ? BorderSide(color: greyColor) : BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

part of 'widget.dart';

class CustomButton extends StatelessWidget {
  // final String title;
  // final TextStyle? titleTextStyle;
  final double? borderRadius;
  final Color backgroundColor;
  final double width;
  final double height;
  final Function()? onPressed;
  final Widget child;
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.backgroundColor,
    required this.width,
    required this.height,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 25.w),
        ),
        child: child,
      ),
    );
  }
}

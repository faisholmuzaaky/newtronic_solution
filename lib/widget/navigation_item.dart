part of 'widget.dart';

class NavigationItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final Color iconColor;
  const NavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 17.w,
            height: 17.w,
            color: iconColor,
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: fontTextStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}

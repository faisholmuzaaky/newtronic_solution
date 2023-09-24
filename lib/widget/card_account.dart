part of 'widget.dart';

class CardAccount extends StatelessWidget {
  final Color backgroundColor;
  const CardAccount({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300.w,
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 25.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Newtronic Account',
            style: fontTextStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Account No : 1234 124 124 124',
            style: fontTextStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Balance',
            style: fontTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'RP 28.000.000',
            style: fontTextStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: whiteColor,
            ),
          ),
          SizedBox(height: 27.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  fixedSize: Size(140.w, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Pindah Dana',
                  style: fontTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 15.w),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  fixedSize: Size(100.w, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/QR.png',
                      width: 18.w,
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      'QRIS',
                      style: fontTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 44.h),
          Text(
            'Expiry Date 12/28',
            style: fontTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

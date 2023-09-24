part of 'widget.dart';

class CardRecentTransaksi extends StatelessWidget {
  final String platform;
  final String tanggal;
  final String harga;
  final String imageUrl;
  const CardRecentTransaksi({
    super.key,
    required this.platform,
    required this.tanggal,
    required this.harga,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF7BC0FF),
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 35.w,
          ),
          SizedBox(width: 22.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: fontTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteColor,
                  ),
                ),
                Text(
                  tanggal,
                  style: fontTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteColor,
                  ),
                )
              ],
            ),
          ),
          Text(
            '-$harga',
            style: fontTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}

part of 'widget.dart';

class CardFavoritTransaksi extends StatelessWidget {
  final String nama;
  final String imageUrl;
  const CardFavoritTransaksi({
    super.key,
    required this.nama,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: greyColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 16.w),
          Text(
            nama,
            style: fontTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
          SizedBox(width: 34.w),
        ],
      ),
    );
  }
}

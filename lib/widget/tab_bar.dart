part of 'widget.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;
  const CustomTabBar({
    super.key,
    this.selectedIndex = 0,
    required this.titles,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          //garis abu-abu
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 1,
            color: greyColor,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: titles
                  .map((title) => Padding(
                        padding: EdgeInsets.only(
                          left: (titles.indexOf(title) == 0) ? 0 : 20.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //title
                            GestureDetector(
                              onTap: () => onTap!(titles.indexOf(title)),
                              child: Text(
                                title,
                                style: (titles.indexOf(title) == selectedIndex)
                                    ? fontTextStyle.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      )
                                    : fontTextStyle.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: greyColor,
                                      ),
                              ),
                            ),
                            //Garis biru
                            Container(
                              width: 50.w,
                              height: 3.h,
                              margin: EdgeInsets.only(top: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: (titles.indexOf(title) == selectedIndex)
                                    ? primaryColor
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

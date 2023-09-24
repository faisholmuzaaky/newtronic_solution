part of screen;

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  int selectedTab = 0;
  List<String> listTabBar = ['Rekening', 'Favorit', 'Autodebit'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buttonBack(),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Transfer',
              style: fontTextStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          searchBar(),
          tabBar(),
          content(),
        ],
      ),
    );
  }

  Widget buttonBack() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 87.h,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: 30.h,
      ),
      child: CustomTextFormField(
        height: 50.h,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            top: 11.h,
            right: 15.w,
            bottom: 11.h,
          ),
          child: Image.asset(
            'assets/Vector (5).png',
            width: 24,
          ),
        ),
        hintText: 'Cari',
        hintStyle: fontTextStyle.copyWith(
          fontSize: 20.sp,
          color: const Color(0xFFAFADAD),
          fontWeight: FontWeight.w500,
        ),
        fillColor: const Color(0xFFEEEEEE),
        borderSide: false,
      ),
    );
  }

  Widget tabBar() {
    return Container(
      margin: EdgeInsets.only(
        left: 30.w,
        top: 15.h,
        right: 30.w,
        bottom: 25.h,
      ),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: const Color(0xFFEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            listTabBar.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 11.h),
                decoration: BoxDecoration(
                  color: selectedTab == index ? whiteColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Text(
                  listTabBar[index],
                  style: fontTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: selectedTab == index
                        ? blackColor
                        : const Color(0xFFAFADAD),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.w,
        top: 25.h,
        right: 30.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Image.asset(
                    'assets/Group 7.png',
                    width: 24.w,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Text(
                'Transfer ke Beberapa',
                style: fontTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 43.h),
          Image.asset(
            'assets/Search.png',
            width: 63.w,
          ),
          SizedBox(height: 25.h),
          Text(
            'Transfer sekarang yuk! Ada promo menarik\nbuat kamu',
            style: fontTextStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFAFADAD),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 76.h),
          CustomButton(
            backgroundColor: primaryColor,
            width: 200,
            height: 70.h,
            child: Text(
              'Transfer Baru',
              style: fontTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TambahTransfer(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

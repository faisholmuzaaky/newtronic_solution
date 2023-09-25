part of screen;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  int cardIndex = 0;

  int selectedNav = 1;

  List navigation = [
    {'title': 'Tracker', 'icon': 'assets/tracker.png'},
    {'title': 'Home', 'icon': 'assets/home.png'},
    {'title': 'Portofolio', 'icon': 'assets/portofolio.png'},
  ];

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7BC0FF),
      body: SafeArea(
        child: BlocConsumer<AutentikasiCubit, AutentikasiState>(
          listener: (context, state) {
            if (state is AutentikasiInitial) {
              context.read<ScreenCubit>().setScreen(newScreen: 0);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoarding(),
                  ),
                  (route) => true);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 53.h),
                  headerNav(),
                  SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    // height: 1000,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleHeader(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.w,
                          ),
                          child: CustomTabBar(
                            titles: const [
                              'Akun',
                              'Kartu',
                            ],
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        cardCarousel(),
                        const SizedBox(height: 27),
                        transaksi(),
                        const SizedBox(height: 20),
                        recentActivity(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget headerNav() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          navigation.length,
          (index) => GestureDetector(
            onTap: () => setState(() {
              selectedNav = index;
            }),
            child: NavigationItem(
              icon: navigation[index]['icon'],
              title: navigation[index]['title'],
              backgroundColor: index == selectedNav ? whiteColor : primaryColor,
              iconColor: index == selectedNav ? primaryColor : whiteColor,
              textColor: index == selectedNav ? blackColor : whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget titleHeader() {
    final authCubit = context.read<AutentikasiCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 25.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (authCubit.state is AutentikasiBerhasil)
              ? Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage((authCubit.state as AutentikasiBerhasil)
                          .user
                          .imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
          Column(
            children: [
              Text(
                'Good Morning',
                style: fontTextStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 9.h),
              Text(
                (authCubit.state is AutentikasiBerhasil)
                    ? (authCubit.state as AutentikasiBerhasil).user.nama!
                    : '',
                style: fontTextStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
            ],
          ),
          Container(
            width: 50.w,
            height: 50.w,
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/notification.png'),
          ),
        ],
      ),
    );
  }

  Widget cardCarousel() {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 2,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 25 : 0,
                right: 20,
              ),
              child: CardAccount(
                backgroundColor: index != cardIndex
                    ? primaryColor.withOpacity(0.35)
                    : primaryColor,
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            animateToClosest: false,
            enableInfiniteScroll: false,
            aspectRatio: 1 / 3,
            padEnds: false,
            onPageChanged: (index, reason) {
              setState(() {
                cardIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: Row(
            children: List.generate(
              2,
              (index) => Container(
                height: 10.h,
                width: cardIndex == index ? 45.w : 20.w,
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  color: cardIndex == index ? primaryColor : greyColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget transaksi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(
            'Transaksi Favorit',
            style: fontTextStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferScreen(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 25.w, right: 15.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    '+ Transaksi',
                    style: fontTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  listUserMock.length,
                  (index) => CardFavoritTransaksi(
                    nama: listUserMock[index].nama!,
                    imageUrl: listUserMock[index].imageUrl!,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.read<AutentikasiCubit>().logout(),
                child: Container(
                  margin: EdgeInsets.only(right: 15.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    'Log out',
                    style: fontTextStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget recentActivity() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: fontTextStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
              listTransaksiMock.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: CardRecentTransaksi(
                  platform: listTransaksiMock[index].platform!,
                  tanggal: listTransaksiMock[index].tanggal!,
                  harga: listTransaksiMock[index].harga!,
                  imageUrl: listTransaksiMock[index].imageUrl!,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

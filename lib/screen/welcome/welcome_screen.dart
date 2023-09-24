part of screen;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: Logo()),
                SizedBox(height: 170.h),
                Center(
                  child: Container(
                    width: 286.w,
                    height: 240.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/welcome.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Welcome',
                  style: fontTextStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  'Create an account and get access\nto all cool stuff',
                  style: fontTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 63.h,
                ),
                CustomButton(
                  backgroundColor: primaryColor,
                  width: 250.w,
                  height: 45.h,
                  child: Text(
                    'Get Started',
                    style: fontTextStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                  onPressed: () {
                    context.read<ScreenCubit>().jumpTo(index: 1);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Dont have an account?',
                    style: fontTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign up',
                        style: fontTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: darkBlueColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.read<ScreenCubit>().jumpTo(index: 2);
                          },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                WidgetsBinding.instance.window.viewInsets.bottom == 0
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: 30.w,
                          top: 10.h,
                          bottom: 20.h,
                        ),
                        child: Row(
                          children: List.generate(
                            context.read<ScreenCubit>().screen.length,
                            (index) => Container(
                              height: 10.h,
                              width: 30.w,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                color:
                                    context.watch<ScreenCubit>().activeScreen ==
                                            index
                                        ? darkBlueColor
                                        : greyColor,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

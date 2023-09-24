part of screen;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  bool isPasswordVisible = false;
  bool isActiveButton = false;
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
              mainAxisSize: MainAxisSize.max,
              children: [
                const Center(child: Logo()),
                SizedBox(height: 70.h),
                Text(
                  'Log in Now',
                  style: fontTextStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Please log in to continue using app',
                  style: fontTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 55.w,
                      top: 176.h,
                      right: 55.h,
                    ),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: 'Email',
                          prefixIcon: Container(
                            width: 24.w,
                            height: 18.h,
                            margin: EdgeInsets.only(left: 23.w, right: 16.w),
                            child: Image.asset(
                              'assets/message.png',
                            ),
                          ),
                          validator: (value) {
                            return Validation.validasiEmail(value!);
                          },
                          onChanged: (value) {
                            if (emailController.text.isNotEmpty ||
                                passworController.text.isNotEmpty) {
                              isActiveButton = true;
                            } else {
                              isActiveButton = false;
                            }
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextFormField(
                          isPassword: !isPasswordVisible,
                          controller: passworController,
                          hintText: 'Password',
                          prefixIcon: Container(
                            width: 14.w,
                            height: 22.h,
                            margin: EdgeInsets.only(left: 27.w, right: 22.w),
                            child: Image.asset(
                              'assets/password.png',
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            }),
                            child: isPasswordVisible
                                ? Icon(
                                    Icons.visibility_outlined,
                                    color: greyColor,
                                  )
                                : Icon(
                                    Icons.visibility_off_outlined,
                                    color: greyColor,
                                  ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Bagian ini tidak boleh kosong';
                            }
                            if (value.length < 8) {
                              return 'password terdiri minimal 8 karakter';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password',
                            style: fontTextStyle.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFAFADAD),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        BlocConsumer<AutentikasiCubit, AutentikasiState>(
                          listener: (context, state) {
                            if (state is AutentikasiBerhasil) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                            if (state is AutentikasiLoginGagal) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.pesan)));
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              backgroundColor: isActiveButton
                                  ? primaryColor
                                  : const Color(0xFFC8C8C8),
                              width: 250.w,
                              height: 45.h,
                              onPressed: isActiveButton
                                  ? () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AutentikasiCubit>().login(
                                            email: emailController.text,
                                            password: passworController.text);
                                      }
                                    }
                                  : null,
                              child: (state is AutentikasiLoading)
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.h,
                                        horizontal: 10.w,
                                      ),
                                      child: CircularProgressIndicator(
                                        color: whiteColor,
                                      ),
                                    )
                                  : Text(
                                      'Log in',
                                      style: fontTextStyle.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: whiteColor,
                                      ),
                                    ),
                            );
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
                                      context
                                          .read<ScreenCubit>()
                                          .jumpTo(index: 2);
                                    }),
                            ],
                          ),
                        )
                      ],
                    ),
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

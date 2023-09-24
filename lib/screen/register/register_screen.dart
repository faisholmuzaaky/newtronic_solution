part of screen;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isCPasswordVisible = false;

  bool isActiveButton = false;

  activeButton() {
    if (fullnameController.text.isNotEmpty ||
        usernameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        passworController.text.isNotEmpty ||
        cpasswordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    fullnameController.addListener(() {
      final isActiveButton = fullnameController.text.isNotEmpty;
      setState(() {
        this.isActiveButton = isActiveButton;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passworController.dispose();
    cpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Center(child: Logo()),
                  SizedBox(height: 70.h),
                  Text(
                    'Sign Up Now',
                    style: fontTextStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Please fill detail to create account',
                    style: fontTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 55.w,
                          top: 46.h,
                          right: 55.h,
                        ),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: fullnameController,
                              hintText: 'Full Name',
                              prefixIcon: Container(
                                width: 22.w,
                                height: 22.h,
                                margin:
                                    EdgeInsets.only(left: 22.w, right: 19.w),
                                child: Image.asset(
                                  'assets/user.png',
                                ),
                              ),
                              onChanged: (value) {
                                if (fullnameController.text.isNotEmpty ||
                                    usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    passworController.text.isNotEmpty ||
                                    cpasswordController.text.isNotEmpty) {
                                  isActiveButton = true;
                                } else {
                                  isActiveButton = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                return Validation.validasiFullname(value!);
                              },
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            CustomTextFormField(
                              controller: usernameController,
                              hintText: 'Username',
                              prefixIcon: Container(
                                width: 22.w,
                                height: 22.h,
                                margin:
                                    EdgeInsets.only(left: 22.w, right: 19.w),
                                child: Image.asset(
                                  'assets/user.png',
                                ),
                              ),
                              onChanged: (value) {
                                if (fullnameController.text.isNotEmpty ||
                                    usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    passworController.text.isNotEmpty ||
                                    cpasswordController.text.isNotEmpty) {
                                  isActiveButton = true;
                                } else {
                                  isActiveButton = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                return Validation.validasiUsername(value!);
                              },
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              hintText: 'Email',
                              prefixIcon: Container(
                                width: 24.w,
                                height: 18.h,
                                margin:
                                    EdgeInsets.only(left: 23.w, right: 16.w),
                                child: Image.asset(
                                  'assets/message.png',
                                ),
                              ),
                              onChanged: (value) {
                                if (fullnameController.text.isNotEmpty ||
                                    usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    passworController.text.isNotEmpty ||
                                    cpasswordController.text.isNotEmpty) {
                                  isActiveButton = true;
                                } else {
                                  isActiveButton = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                return Validation.validasiEmail(value!);
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
                                margin:
                                    EdgeInsets.only(left: 27.w, right: 22.w),
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
                              onChanged: (value) {
                                if (fullnameController.text.isNotEmpty ||
                                    usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    passworController.text.isNotEmpty ||
                                    cpasswordController.text.isNotEmpty) {
                                  isActiveButton = true;
                                } else {
                                  isActiveButton = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                return Validation.validasiPassword(value!);
                              },
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            CustomTextFormField(
                              controller: cpasswordController,
                              isPassword: !isCPasswordVisible,
                              hintText: 'Confirm Password',
                              prefixIcon: Container(
                                width: 14.w,
                                height: 22.h,
                                margin: EdgeInsets.only(
                                  left: 27.w,
                                  right: 22.w,
                                ),
                                child: Image.asset(
                                  'assets/password.png',
                                ),
                              ),
                              suffixIcon: Container(
                                width: 22.w,
                                height: 17.h,
                                margin: EdgeInsets.only(
                                  top: 11.h,
                                  right: 15.w,
                                  bottom: 11.h,
                                ),
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    isCPasswordVisible = !isCPasswordVisible;
                                  }),
                                  child: isCPasswordVisible
                                      ? Icon(
                                          Icons.visibility_outlined,
                                          color: greyColor,
                                        )
                                      : Icon(
                                          Icons.visibility_off_outlined,
                                          color: greyColor,
                                        ),
                                ),
                              ),
                              onChanged: (value) {
                                if (fullnameController.text.isNotEmpty ||
                                    usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    passworController.text.isNotEmpty ||
                                    cpasswordController.text.isNotEmpty) {
                                  isActiveButton = true;
                                } else {
                                  isActiveButton = false;
                                }
                                setState(() {});
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Bagian ini tidak boleh kosong';
                                }
                                if (value != passworController.text) {
                                  return 'password tidak sama';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 83.h,
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
                                if (state is AutentikasiPendaftaranGagal) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(state.pesan)));
                                }
                              },
                              builder: (context, state) {
                                return CustomButton(
                                  backgroundColor:
                                      isActiveButton ? primaryColor : greyColor,
                                  width: 250.w,
                                  height: 45.h,
                                  onPressed: isActiveButton
                                      ? () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final user = UserModels(
                                              nama: fullnameController.text,
                                              username: usernameController.text
                                                  .toLowerCase(),
                                              email: emailController.text,
                                              password: passworController.text,
                                              imageUrl: 'assets/Profile.png',
                                            );
                                            context
                                                .read<AutentikasiCubit>()
                                                .signUp(user: user);
                                          }
                                        }
                                      : null,
                                  child: (state is AutentikasiLoading)
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.h,
                                            horizontal: 20.h,
                                          ),
                                          child: CircularProgressIndicator(
                                            color: whiteColor,
                                          ),
                                        )
                                      : Text(
                                          'Sign Up',
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
                                text: 'Already have an account?',
                                style: fontTextStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Login',
                                    style: fontTextStyle.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkBlueColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context
                                            .read<ScreenCubit>()
                                            .jumpTo(index: 1);
                                      },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
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
                                  color: context
                                              .watch<ScreenCubit>()
                                              .activeScreen ==
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
      },
    );
  }
}

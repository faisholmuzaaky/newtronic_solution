part of 'widget.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 80.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Logo.png'),
        ),
      ),
    );
  }
}

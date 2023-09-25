part of screen;

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenCubit = context.read<ScreenCubit>();
    context.read<AutentikasiCubit>().cekLogin();
    return Scaffold(
      body: BlocConsumer<AutentikasiCubit, AutentikasiState>(
        listener: (context, state) {
          if (state is AutentikasiBerhasil) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => true,
            );
          }
        },
        builder: (context, state) {
          return PageView.builder(
            controller: context.watch<ScreenCubit>().pageController,
            onPageChanged: (index) {
              screenCubit.setScreen(newScreen: index);
            },
            itemCount: screenCubit.screen.length,
            itemBuilder: (context, index) {
              return screenCubit.screen[index];
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newtronic_solution/cubit/autentikasi/autentikasi_cubit.dart';
import 'package:newtronic_solution/cubit/screen_cubit.dart';
import 'package:newtronic_solution/cubit/transfer/transfer_cubit.dart';
import 'package:newtronic_solution/screen/screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ScreenCubit>(
            create: (context) => ScreenCubit(),
          ),
          BlocProvider<AutentikasiCubit>(
            create: (context) => AutentikasiCubit(),
          ),
          BlocProvider<TransferCubit>(
            create: (context) => TransferCubit(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoarding(),
        ),
      ),
    );
  }
}

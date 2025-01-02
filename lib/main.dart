import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/pages.dart';
import 'common/values/colors.dart';

import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          // need to init the EasyLoading before using it in asyncPostAllData Func
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: buildTheme(),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.primaryText,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

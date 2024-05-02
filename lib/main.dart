import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_favorite_wepsites/core/app_bussines_logic/cubit/app_cubit.dart';
import 'package:my_favorite_wepsites/features/categories_home/presentation/views/categories_home_view.dart';

import 'core/servies_locator/servies_locator.dart';
import 'features/categories_home/presentation/bussines_logic/cubit/categories_cubit.dart';
import 'features/sections/presentation/bussines_logic/sections_cubit/sections_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
        BlocProvider(create: (context) => sl<SectionsCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Favorite Websites',
            theme: ThemeData(),
            home: const CategotiesHomeView(),
          );
        },
      ),
    );
  }
}

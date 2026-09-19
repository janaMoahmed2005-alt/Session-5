import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app_router.dart';
//import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_theme.dart';
import 'package:flutter_application_1/injection_container.dart';
//import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {//the first line, lma 2t2kd 2n kol 7aga initialized
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); //when the app open, kol 2l instens htgili
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),

    child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: state.isDark ? AppTheme().Darktheme() : AppTheme().Lighttheme(),
      routerConfig: AppRouter.appRouter,
    );
    },
    ),
    );
  }
}
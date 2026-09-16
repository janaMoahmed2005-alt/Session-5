import 'package:flutter_application_1/product_cubit.dart';
import 'package:flutter_application_1/product_screen.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/home_screen.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.homeScreen,
        builder: (context, state) {
          return HomeScreen(title: 'Home');
        },
      ),

      GoRoute(
        path: "/${Routes.signUpScreen}",
        name: Routes.signUpScreen,
        builder: (context, state) {
          return signUpScreen();
        },
      ),

      GoRoute(
        path: "/${Routes.productScreen}",
        name: Routes.productScreen,
        builder: (context, state) {
          final String? title = state.uri.queryParameters['title'];
          return BlocProvider(
            create: (context) => ProductCubit(),
            child: ProductScreen(title: title ?? ""),
          );
        },
      ),
    ],
  );
}

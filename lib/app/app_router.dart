import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/local_storage/base_local_storage.dart';
// import 'package:flutter_application_1/data/data_source/impl/product_details_data_source_impl.dart';
// import 'package:flutter_application_1/data/external/dio/dio_consumer.dart';
// import 'package:flutter_application_1/data/repos/product_details_repo_impl.dart';
import 'package:flutter_application_1/injection_container.dart';
import 'package:flutter_application_1/presentation/cubit/category/category_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_details_cubit.dart';
import 'package:flutter_application_1/presentation/screens/cart_screen.dart';
import 'package:flutter_application_1/presentation/screens/product_details_screen.dart';
import 'package:flutter_application_1/presentation/screens/product_screen.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_application_1/presentation/screens/settings_screen.dart';
import 'package:flutter_application_1/presentation/screens/splash_screen.dart';
import 'package:flutter_application_1/presentation/screens/verification_screen.dart';
import 'package:flutter_application_1/presentation/screens/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';
final navigatorKey = GlobalKey<NavigatorState>();
class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: Routes.splashScreen,
        builder: (context, state) {
          return SplashScreen(localStorage: getIt<BaseLocalStorage>());
        },
      ),
      GoRoute(
        path: "/${Routes.onBoarding}",
        name: Routes.onBoarding,
        builder: (context, state) {
          return OnboardingScreen(localStorage: getIt<BaseLocalStorage>());
        },
      ),
      GoRoute(
        path: "/${Routes.homeScreen}",
        name: Routes.homeScreen,
        builder: (context, state) {
          return HomeScreen(title: 'Home');
        },
      ),

      GoRoute(
        path: "/${Routes.signUpScreen}",
        name: Routes.signUpScreen,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),

      GoRoute(
        path: "/${Routes.verificationScreen}",
        name: Routes.verificationScreen,
        builder: (context, state) {
          final String email =
              state.uri.queryParameters['email'] ?? '';

          return VerificationScreen(
            email: email,
          );
        },
      ),
      GoRoute(
  path: "/${Routes.productScreen}",
  name: Routes.productScreen,
  builder: (context, state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductCubit>()..fetchProducts(),
        ),
        BlocProvider(
          create: (_) => getIt<CategoryCubit>()..getCategories(),
        ),
      ],
      child: const ProductScreen(title: "Home Page"),
    );
  },
),
GoRoute(
  path: "/${Routes.productDetailsScreen}",
  name: Routes.productDetailsScreen,
  builder: (context, state) {
    final id = state.uri.queryParameters['id'] ?? "";
    return BlocProvider(
      create: (_) => getIt<ProductDetailsCubit>()..fetchDetails(id),
      child: ProcductDetailsScreen(productId: id),
    );
  },
),
GoRoute(
  name: Routes.settingsScreen,
  path: '/settings',
  builder: (context, state) => const SettingsScreen(),
),
      GoRoute(
        path: "/${Routes.cartScreen}",
        name: Routes.cartScreen,
        builder: (context, state) {
          return CartScreen();
        },
      ),
    ],
  );
}

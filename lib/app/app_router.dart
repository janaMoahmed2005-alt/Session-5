import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/data/data_source/impl/product_details_data_source_impl.dart';
// import 'package:flutter_application_1/data/external/dio/dio_consumer.dart';
// import 'package:flutter_application_1/data/repos/product_details_repo_impl.dart';
import 'package:flutter_application_1/injection_container.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_details_cubit.dart';
import 'package:flutter_application_1/presentation/screens/product_details_screen.dart';
import 'package:flutter_application_1/presentation/screens/product_screen.dart';
import 'package:flutter_application_1/app/routes.dart';
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
    return BlocProvider(
      create: (_) => getIt<ProductCubit>()..fetchProducts(),
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
      
    ],
  );
}

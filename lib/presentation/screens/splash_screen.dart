import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/core/local_storage/base_local_storage.dart';
import 'package:flutter_application_1/core/constant/local_keys.dart';
//import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this._localStorage});

  final BaseLocalStorage _localStorage;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    final bool? isOpen = await widget._localStorage.getBool(LocalKeys.isOpen);
    //final String? token = await widget._localStorage.getBool(LocalKeys.isOpen);

    Future.delayed(Duration(seconds: 2), () {
      if (isOpen == null) {
        context.pushNamed(Routes.onBoarding);
      } else {
        context.pushNamed(Routes.homeScreen);
        // if (token == null) {
        //   context.pushNamed(Routes.signUpScreen);
        // } else {
        //   context.pushNamed(Routes.productScreen);
        // }
      }
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: CachedNetworkImage(
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/011/401/535/small/online-shopping-trolley-click-and-collect-order-logo-design-template-vector.jpg',
        width: 250,
        height: 250,
        fit: BoxFit.contain,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) {
          return const Icon(
            Icons.error,
            size: 50,
          );
        },
      ),
    ),
  );
}
}
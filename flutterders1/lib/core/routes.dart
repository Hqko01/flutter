import 'package:flutterders1/screens/client/login.dart';
import 'package:flutterders1/screens/client/profile.dart';
import 'package:flutterders1/screens/client/register.dart';
import 'package:flutterders1/screens/core/error.dart';
import 'package:flutterders1/screens/core/loader.dart';
import 'package:flutterders1/screens/home.dart';
import 'package:flutterders1/screens/product/product.dart';
import 'package:flutterders1/screens/product/search.dart';
import 'package:flutterders1/screens/static/about.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const errorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const loaderScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const homeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const loginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const registerScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const profileScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const aboutScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const productScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const searchScreen(),
    ),
  ],
);

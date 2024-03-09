import 'package:flutter/material.dart';
import 'package:food_app2/screens/my_cart.dart';
import 'package:food_app2/screens/favorites_screen.dart';
import 'package:food_app2/screens/home_screen.dart';
import 'package:food_app2/screens/item_details_screen.dart';
import 'package:food_app2/screens/profile_screen.dart';
import 'package:food_app2/screens/screen.dart';
import 'package:go_router/go_router.dart';
part 'routes.dart';

class RoutesPages {
  static final router = GoRouter(routes: [
    GoRoute(
        path: Routes.screen,
        pageBuilder: (context, state) => const MaterialPage(child: Screen())),
    GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage())),
    GoRoute(
        path: Routes.favorites,
        pageBuilder: (context, state) =>
            const MaterialPage(child: FavoritesPage())),
    GoRoute(
        path: Routes.profile,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ProfilePage())),
    GoRoute(
        name: Routes.itemetails,
        path: Routes.itemetails,
        pageBuilder: (context, state) => MaterialPage(
            child:
                ItemDetailsPage(id: int.parse(state.pathParameters['id']!)))),
    GoRoute(
        name: Routes.mycart,
        path: Routes.mycart,
        pageBuilder: (context, state) => const MaterialPage(child: MyCart())),
  ]);
}

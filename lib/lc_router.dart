import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lcargo/lc_home_page.dart';
import 'package:lcargo/src/screens/lc_calculation.dart';
import 'package:lcargo/src/screens/lc_faq.dart';
import 'package:lcargo/src/screens/lc_order_details.dart';
import 'package:lcargo/src/screens/lc_orders.dart';
import 'package:lcargo/src/screens/lc_profile.dart';

const orderList = 'orderList';
const orderDetails = 'orderDetails';
const calculation = 'calculation';
const faq = 'faq';
const profile = 'profile';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final GlobalKey<NavigatorState> _sectionOrdersNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'ordersNavigator');
final GlobalKey<NavigatorState> _sectionCalculationNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'calculationNavigator');
final GlobalKey<NavigatorState> _sectionFaqNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'faqNavigator');
final GlobalKey<NavigatorState> _sectionProfileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profileNavigator');

class LCRouter {
  // final LoginState loginState;
  //
  // LCAppRouter(this.loginState);

  final lcRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // initialLocation: '/$orderList',
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return LCHomePage(
            navShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionOrdersNavigatorKey,
            routes: [
              GoRoute(
                name: orderList,
                path: '/',
                builder: (ctx, st) => const LCOrders(),
                // routes: [
                //   GoRoute(
                //     name: orderDetails,
                //     path: 'orderDetails',
                //     builder: (ctx, st) => const LCOrderDetails(),
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionCalculationNavigatorKey,
            routes: [
              GoRoute(
                name: calculation,
                path: '/calculation',
                builder: (ctx, st) => const LCCalculation(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionFaqNavigatorKey,
            routes: [
              GoRoute(
                name: faq,
                path: '/faq',
                builder: (ctx, st) => const LCFaq(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionProfileNavigatorKey,
            routes: [
              GoRoute(
                name: profile,
                path: '/profile',
                builder: (ctx, st) => const LCProfile(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: orderDetails,
        path: '/orderDetails',
        builder: (ctx, st) => const LCOrderDetails(),
      ),
    ],
    debugLogDiagnostics: true,
  );
}

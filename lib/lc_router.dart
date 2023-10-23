import 'package:go_router/go_router.dart';
import 'package:lcargo/lc_home_page.dart';

class LCRouter {
  // final LoginState loginState;
  //
  // LCAppRouter(this.loginState);

  final lcRouter = GoRouter(routes: [
    GoRoute(path: '/', builder: (ctx, st) => const LCHomePage()),
  ]);
}

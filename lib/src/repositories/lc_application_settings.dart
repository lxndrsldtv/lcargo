import 'dart:ui';

// static const bottomNavbarBackgroundColor = Color(0xffF9F9F9);
// static const bottomNavbarSelectedItemColor = Color(0xff1F284D);

abstract interface class LCApplicationSettings {}

abstract interface class Query<Result> {}

abstract interface class QueryHandler<Query, Result> {
  Result handle(Query query);
}

class FindBottomNavigationBarBackgroundColorQuery implements Query<Color> {}

class FindBottomNavigationBarBackgroundColorQueryHandler
    implements
        QueryHandler<FindBottomNavigationBarBackgroundColorQuery, Color> {
  @override
  Color handle(FindBottomNavigationBarBackgroundColorQuery query) {
    return const Color(0xFFF9F9F9);
  }
}

class FindBottomNavigationBarSelectedItemColorQuery implements Query<Color> {}

class FindBottomNavigationBarSelectedItemColorQueryHandler
    implements
        QueryHandler<FindBottomNavigationBarSelectedItemColorQuery, Color> {
  @override
  Color handle(FindBottomNavigationBarSelectedItemColorQuery query) {
    return const Color(0xFF1F284D);
  }
}

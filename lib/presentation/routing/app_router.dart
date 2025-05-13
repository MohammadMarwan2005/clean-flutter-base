import 'package:clean_flutter_base/common/di/get_it.dart';
import 'package:clean_flutter_base/presentation/feature/test/test_cubit.dart';
import 'package:clean_flutter_base/presentation/feature/test/test_screen.dart';
import 'package:clean_flutter_base/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// class AppRouter {
//   Route<dynamic>? generateRoute(RouteSettings settings) {
//     //this arguments to be passed in any screen like this ( arguments as ClassName )
//     final arguments = settings.arguments;
//
//     switch (settings.name) {
//       case Routes.testScreen:
//         return MaterialPageRoute(
//           builder:
//               (_) => BlocProvider<TestCubit>(
//                 create: (context) => getIt(),
//                 child: TestScreen(),
//               ),
//         );
//       case Routes.loadingScreen:
//         return MaterialPageRoute(
//           builder:
//               (_) => const Scaffold(
//                 body: Center(child: CircularProgressIndicator()),
//               ),
//         );
//       default:
//         return MaterialPageRoute(builder: (context) => Scaffold(body: Text("page not found!"),),);
//     }
//   }
// }

final GlobalKey<NavigatorState> goRouteRootNavigatorKey =
    GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: goRouteRootNavigatorKey,
  initialLocation: Routes.testScreen,
  routes: [
    GoRoute(
      path: Routes.testScreen,
      builder:
          (context, state) => BlocProvider<TestCubit>(
            create: (context) => getIt(),
            child: TestScreen(),
          ),
    ),
  ],
);

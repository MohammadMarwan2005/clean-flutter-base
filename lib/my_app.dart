import 'package:clean_flutter_base/presentation/feature/test/test_screen.dart';
import 'package:clean_flutter_base/presentation/main/main_cubit.dart';
import 'package:clean_flutter_base/presentation/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Core App',
            theme: ThemeData(
              primaryColor: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            home: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return state.when(
                  done: () => const TestScreen(),
                  loading:
                      () => const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

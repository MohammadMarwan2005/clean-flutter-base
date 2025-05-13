import 'package:clean_flutter_base/presentation/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/di/get_it.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp(appRouter: appRouter));
}

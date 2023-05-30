import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_storage/persistent_storage_core.dart';
import 'package:vsounds/router/router_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      // background status bar
      systemNavigationBarColor: Colors.black,

      // background Navigation
      statusBarIconBrightness: Brightness.light,

      // set màu cho icon của status bar
      // systemNavigationBarDividerColor: Colors.orangeAccent,
    ),
  );
  await PersistentStorageCore.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
        return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterConfiguration,
    );
  }
}

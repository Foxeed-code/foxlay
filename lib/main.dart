import 'package:flutter/material.dart';

//import 'package:ehospital/components/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:ehospital/screens/home.dart';

import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1024, 780),

    //alwaysOnTop: true,
    // maximumSize: Size(Get.width, Get.height * .8),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.setMaximizable(true);
    await windowManager.isMaximized();

    await windowManager.focus();
  });
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(const MyApp());
  // });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      title: 'Desktop Application',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
        textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.inter(textStyle: textTheme.bodyMedium),
        ),
      ),
      themeMode: ThemeMode.dark,
      // theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/home",
      getPages: [
        //GetPage(name: '/login', page: () => const LoginPage(), transition: Transition.rightToLeftWithFade),
        GetPage(name: '/home', page: () => MyHomePage(), transition: Transition.rightToLeftWithFade),
      ],
    );
  }
}

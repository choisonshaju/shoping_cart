import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shpoing_cart/presentaion/home_screen/controller/home_screen_controller.dart';
import 'package:shpoing_cart/presentaion/home_screen/view/Home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home_screen(),
      ),
    );
  }
}

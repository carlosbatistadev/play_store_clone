import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_store_clone/app/presenter/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Play Store Clone',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          labelColor: Colors.blue.shade800,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      routes: {
        HomePage.route: (context) => const HomePage(),
      },
    );
  }
}

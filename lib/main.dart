import "package:bereal/views/info_page.dart";
import "package:bereal/views/name_page.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "BeReal",
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: InfoPage.routeID,
      routes: {
        InfoPage.routeID: (ctx) => const InfoPage(),
        NamePage.routeID: (ctx) => const NamePage(),
      },
    );
  }
}

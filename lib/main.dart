import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lessons/first_lecture/provider/count_provider.dart';
import 'package:provider_lessons/first_lecture/screens/count_Example.dart';
import 'package:provider_lessons/fourth_lecture/provider/theme_change_provider.dart';
import 'package:provider_lessons/fourth_lecture/screens/dark_theme.dart';
import 'package:provider_lessons/second_lecture/provider/container_one_provider.dart';
import 'package:provider_lessons/second_lecture/screen/slider_example.dart';
import 'package:provider_lessons/third_lecture/provider/favourite_provider.dart';
import 'package:provider_lessons/third_lecture/screens/favourite_screen.dart';
import 'package:provider_lessons/third_lecture/screens/my_favourites.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => ContainerOneProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => ThemeChangeProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            useMaterial3: false,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.red,
            ),
            primaryColor: Colors.red,
            primarySwatch: Colors.red,
            useMaterial3: false,
          ),
          routes: {
            '/myFavourites': (context) => MyFavourites(),
          },
          home: const DarkThemeScreen(),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kidzone_app/Screens/adve_Screen.dart';
import 'package:kidzone_app/Screens/centers_details_screen.dart';
import 'package:kidzone_app/Screens/centers_screen.dart';
import 'package:kidzone_app/Screens/profile_screen.dart';
import 'package:kidzone_app/Screens/splash_screen.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Centers(),
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', 'AE'), // English, no country code
          ],
          debugShowCheckedModeBanner: false,
          title: 'kidZone',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepPurpleAccent),
          ),
          home: SplashScreen(),
          routes: {
            CentersDetailScreen.routName: (ctx) => CentersDetailScreen(),
          }),
    );
  }
}
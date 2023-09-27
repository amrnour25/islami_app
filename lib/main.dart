import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/spash_screen.dart';
import 'package:islami_app/ui/screens/details_screens/details_screens.dart';
import 'package:islami_app/ui/screens/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (_)=> settingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late settingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale(provider.currentLocale),
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        splash_screen.splashRoute: (_) => splash_screen(),
        HomeScreen.homeRoute: (_) => HomeScreen(),
        DetailsScreen.detailsRoute: (_) => DetailsScreen()
      },
      initialRoute: splash_screen.splashRoute,
    );
  }

}

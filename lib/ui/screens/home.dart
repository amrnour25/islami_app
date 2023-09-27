import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/ui/screens/tabs/ahades_tab.dart';
import 'package:islami_app/ui/screens/tabs/quran_tab.dart';
import 'package:islami_app/ui/screens/tabs/radio_tab.dart';
import 'package:islami_app/ui/screens/tabs/sebha_tab.dart';
import 'package:islami_app/ui/screens/tabs/settings_tab.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatefulWidget {
  static const String homeRoute= "homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs=[
    QuranTab(),AhadesTab(),SebhaTab(),RadioTab(),SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    settingsProvider provider =Provider.of(context);
    return Container(
      decoration:  BoxDecoration(image: DecorationImage(image: AssetImage(provider.isDarkMode() ?
          AppAssets.background_dark : AppAssets.background),fit: BoxFit.fill)),
      child: Scaffold(
        //backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami,),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildButtomNavigationBar(),
      ),
    );
  }
  Widget buildButtomNavigationBar()=> Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (index){
          currentTabIndex =index;
          setState(() {
          });
        },
        items:
        [
          BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppAssets.ic_quran)) ,label: "Quran"),
          BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppAssets.ic_ahades)) ,label: "Ahades"),
          BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppAssets.ic_sebha)) ,label: "Sebha"),
          BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppAssets.ic_radio)) ,label: "Radio"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
        ]
    ),
  );
}


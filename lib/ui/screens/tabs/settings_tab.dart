import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late settingsProvider provider ;
  bool arSwitch =false;
  bool darkModeSwitch =false;

  @override
  Widget build(BuildContext context) {
    provider =Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.start,),
          buildSettingsRow("العربية", arSwitch, (newValue) {
            arSwitch =newValue;
            if(arSwitch){
              provider.setCurrentLocale("ar");
            }else{
              provider.setCurrentLocale("en");
            }
          }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkModeSwitch, (newValue) {
            darkModeSwitch =newValue;
            if(darkModeSwitch){
              provider.setCurrentMode(ThemeMode.dark);
            }else{
              provider.setCurrentMode(ThemeMode.light);
            }
          })
        ],
      ),
    );
  }

  Widget buildSettingsRow(String title,bool switchValue,Function(bool) onChanged){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title,style:Theme.of(context).textTheme.bodySmall,),
        Spacer(),
        Switch(value:switchValue , onChanged : onChanged
        ,activeColor: AppColors.primaryColor,),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/model/details_screen_args.dart';
import 'package:islami_app/ui/screens/details_screens/details_screens.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:islami_app/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.quran_logo)),
        Divider(),
        Text(AppLocalizations.of(context)!.suraName,style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
        Divider(),
        Expanded(flex: 7,
        child: ListView.builder(
        itemCount: Constants.suraNames.length,
        itemBuilder: (_,index){
          return TextButton(onPressed: (){
            Navigator.pushNamed(context, DetailsScreen.detailsRoute,arguments: DetailsScreenArgs(
                suraOrAhadesName: Constants.suraNames[index], fileName: "${index+1}.txt", isQuranFile: true));
          }, child:
          Text(Constants.suraNames[index],style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,)
          );
        } ),
        ),
      ],
    );
  }
}

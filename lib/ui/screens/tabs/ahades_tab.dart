import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../model/details_screen_args.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';
import '../details_screens/details_screens.dart';

class AhadesTab extends StatelessWidget {
  List<String> ahadesNames =List.generate(50, (index){
    return "${index+1}الحديث رقم ";
});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.ahades_logo)),
        Divider(
          thickness: 3,
          color: AppColors.primaryColor,
        ),
        Text(AppLocalizations.of(context)!.hadesName,style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
        Divider(
          thickness: 3,
          color: AppColors.primaryColor,
        ),
        Expanded(flex: 7,
          child: ListView.builder(
              itemCount: ahadesNames.length,
              itemBuilder: (_,index){
                return TextButton(onPressed: (){
                  Navigator.pushNamed(context, DetailsScreen.detailsRoute,arguments: DetailsScreenArgs(
                      suraOrAhadesName: ahadesNames[index], fileName: "h${index+1}.txt", isQuranFile: false));
                }, child:
                Text(ahadesNames[index],style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,)
                );
              } ),
        ),
      ],
    );
  }
}

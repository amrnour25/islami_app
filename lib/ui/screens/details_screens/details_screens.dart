import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/details_screen_args.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String detailsRoute ="detailsRoute";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String fileContent="";

  @override
  Widget build(BuildContext context) {
   arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;

   if(fileContent.isEmpty) {readFiles();}
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.background),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          title: Text(arguments.suraOrAhadesName,style: AppTheme.appBarTitleTextStyle,),
          centerTitle: true,
          elevation: 0,

        ),
        body:fileContent.isEmpty ? Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(fileContent,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 24,color: AppColors.accentColor),),
          ),
        ),
    ));
  }

  void readFiles() async {
    String file = await rootBundle.loadString(arguments.isQuranFile ? "assets/files/quran/${arguments.fileName}" :
    "assets/files/ahades/${arguments.fileName}");
    fileContent=file;
    List<String> fileLines =file.split("\n");
    for(int i=0;i<fileLines.length;i++){
      fileLines[i] +=arguments.isQuranFile ? "(${i+1})" : " ";
    }
    fileContent = fileLines.join();
    setState(() {
    });

  }
}


import 'package:clean_architecture/utils/constants/colors.dart';
import 'package:clean_architecture/utils/constants/screen_texts.dart';
import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/material.dart';

Widget titleText(BuildContext context,index){
  return Text(OnTexts.onBoardingTexts[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: getWidth(context)*0.05,color: FColors.onBoardingTitleColor));
}

Widget subtitleText(BuildContext context,index){
  return Text(OnTexts.onBoardingSubTitleTexts[index],style:TextStyle(fontSize: getWidth(context)*0.034,color: FColors.onBoardingSubTitleColor ),textAlign: TextAlign.center,);
}

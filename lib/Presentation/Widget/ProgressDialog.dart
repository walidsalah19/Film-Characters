import 'package:filmapp/Constant/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class ProgressDialogClass {
  static  showProgressDialog(BuildContext context) async {
    ProgressDialog pr= ProgressDialog(context,
        type: ProgressDialogType.normal,
        isDismissible: true ,
        showLogs: true);

    pr.style(
        message: 'Downloading file...',
        borderRadius: 10.0,
        backgroundColor: MyColors.myWhite,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle:const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle:const TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    await pr.show();
  }
}

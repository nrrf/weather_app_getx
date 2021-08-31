import 'package:get/state_manager.dart';
import 'package:get/get.dart'; 
import 'package:flutter/cupertino.dart';
class CityController extends GetxController{
  String _inputText = ''; 

  void onInputTextChanged(String text){
    this._inputText = text;
  } 

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(
        result: this._inputText,
      );
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext!,
        builder: (_) => CupertinoActionSheet(
          title: Text('ERROR'),
          message: Text("Ingrese un valor valido"),
          cancelButton: CupertinoActionSheetAction(
            child: Text('ACEPTAR'),
            onPressed: () => Get.back(),
          ),
        ),
      );
    }
  }
}
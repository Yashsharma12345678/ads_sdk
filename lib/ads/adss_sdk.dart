import 'package:ads_sdk/ads/alert_dialogue_modal.dart';
import 'package:flutter/material.dart';

class AdsSdk {
  
  static void showModalAtStart(BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return AlertDialogueModal();
      },
    );
  }
}

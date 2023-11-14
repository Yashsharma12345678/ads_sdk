import 'package:ads_sdk/ads/adss_sdk.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              AdsSdk.showModalAtStart(context);
            },
            child: Text('second screen')),
      ),
    );
  }
}

import 'package:ads_sdk/ads/adss_sdk.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              AdsSdk.showModalAtStart(context);
            },
            child: Text('first screen')),
      ),
    );
  }
}

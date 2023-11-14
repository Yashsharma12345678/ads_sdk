import 'dart:math';

import 'package:ads_sdk/ads/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageList {
  // Map<bool,String> imageData;
  final bool isWhite;
  final String imagePath;

  ImageList({required this.isWhite, required this.imagePath});
}

class AlertDialogueModal extends StatefulWidget {
  const AlertDialogueModal({super.key});

  @override
  State<AlertDialogueModal> createState() => _AlertDialogueModalState();
}

class _AlertDialogueModalState extends State<AlertDialogueModal> {
  String randomImage = '';
  bool isBlack = true;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    updateRandomWord();
    super.initState();
  }

  int getRandomIndex(int listLength) {
    final random = Random();
    return random.nextInt(listLength);
  }

  List<ImageList> imageData = [
    ImageList(
        imagePath: 'assets/videos/com.meditation.medit8video.mp4',
        isWhite: false),
    ImageList(
        imagePath: 'assets/videos/com.walli.hd.wallpapervideo.mp4',
        isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.as.speakercleaner-1.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.as.speakercleaner.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.clock.sandtimer-1.png', isWhite: true),
    ImageList(
        imagePath: 'assets/images/com.clock.sandtimer.png', isWhite: true),
    ImageList(
        imagePath: 'assets/images/com.meditation.medit8-1.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.meditation.medit8-2.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.meditation.medit8.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.music.focusflow-1.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.music.focusflow.png', isWhite: false),
    ImageList(
        imagePath: 'assets/images/com.walli.hd.wallpaper1.png', isWhite: true),
    ImageList(
        imagePath: 'assets/images/com.walli.hd.wallpaper2.png', isWhite: true),
    ImageList(
        imagePath: 'assets/images/com.walli.hd.wallpaper3.png', isWhite: true),
  ];

  void updateRandomWord() {
    if (imageData.isNotEmpty) {
      final randomIndex = getRandomIndex(imageData.length);
      print(randomIndex);
      final randomWord = imageData[randomIndex];
      print(randomWord.imagePath);
      setState(() {
        isBlack = randomWord.isWhite;
        randomImage = randomWord.imagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).viewInsets.bottom > 0) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          return false;
        }
        return false;
      },
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: randomImage.endsWith('mp4')
                ? const VideoPlayerScreen()
                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            randomImage,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: isBlack ? Colors.white : Colors.black,
                    size: 40,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

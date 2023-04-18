import 'package:flutter/material.dart';

import '../static/themes.dart';

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.inputBackground,
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: Themes.bodyLight,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Themes.bubbleText,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type here!",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.camera_alt,
                      color: Themes.bubbleText,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: Themes.bodyLight,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Icon(
                Icons.mic,
                color: Themes.bubbleText,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

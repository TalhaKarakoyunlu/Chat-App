import 'package:flutter/material.dart';

import '../static/themes.dart';

class Bar extends StatelessWidget {
  final String theme;
  const Bar({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme == "light" ? Themes.bodyLight : Themes.bodyDark,
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 0, 25, 0),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: theme == "light"
                          ? Themes.buttonDark
                          : Themes.buttonLight,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg"),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      "Cool Guy",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: Icon(
                      Icons.call_rounded,
                      color: theme == "light"
                          ? Themes.buttonDark
                          : Themes.buttonLight,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: Icon(
                      Icons.videocam_rounded,
                      color: theme == "light"
                          ? Themes.buttonDark
                          : Themes.buttonLight,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: Icon(
                      Icons.more_vert_outlined,
                      color: theme == "light"
                          ? Themes.buttonDark
                          : Themes.buttonLight,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

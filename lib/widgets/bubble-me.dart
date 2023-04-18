import 'package:flutter/material.dart';

import '../static/themes.dart';

class BubbleMe extends StatelessWidget {
  const BubbleMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.fromLTRB(0, 25, 20, 0),
        decoration: const BoxDecoration(
            color: Themes.bubbleMe,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )),
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 5, right: 15, left: 15),
                child: Text(
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Themes.bubbleText,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo turpis, eu fermentum massa. Morbi sit amet pellentesque libero, sit amet suscipit tellus. Aenean pretium, purus non ultrices tristique, mauris metus tristique eros, a scelerisque purus turpis a magna. Donec mattis nunc massa,",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Themes.bubbleTextTime,
                        ),
                        "10:30 p.m."),
                    Icon(
                      Icons.check,
                      color: Themes.bubbleTextTime,
                      size: 17,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

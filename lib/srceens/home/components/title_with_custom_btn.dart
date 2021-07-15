import 'package:flutter/material.dart';
import 'package:nature/constant.dart';

class TitleWithCustomButton extends StatelessWidget {
  const TitleWithCustomButton(
      {Key? key,
      required this.title,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          TextButton(
            child: Text(buttonText),
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({Key? key, required this.text})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: defPadding / 4),
              child: Text(text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    margin: EdgeInsets.only(right: defPadding / 4),
                    height: 0.7,
                    color: primaryColor.withOpacity(0.2)))
          ],
        ));
  }
}

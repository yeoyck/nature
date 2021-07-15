import 'package:flutter/material.dart';
import 'package:nature/constant.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: defPadding,
              right: defPadding,
              bottom: 36 + defPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: <Widget>[
                Text('Nature',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 48.0,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: defPadding),
                  padding: EdgeInsets.symmetric(horizontal: defPadding),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: primaryColor.withOpacity(0.23)),
                    ],
                  ),
                  child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: primaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 12.0),
                            child: Icon(Icons.search,
                                color:
                                    primaryColor), // myIcon is a 48px-wide widget.
                          ))))),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nature/constant.dart';
import 'package:nature/srceens/home/components/header_with_searchbox.dart';
import 'package:nature/srceens/home/components/title_with_custom_btn.dart';

Future<Widget> getImage(String imgURL) async {
  final Completer<Widget> completer = Completer();
  final url = imgURL;
  final image = NetworkImage(url);
  final load = image.resolve(const ImageConfiguration());
  final listener = new ImageStreamListener((ImageInfo info, isSync) async {
    completer.complete(Container(child: Image(image: image)));
  });

  load.addListener(listener);
  return completer.future;
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return window height of screen;
    Size size = MediaQuery.of(context).size;
    // Scrolling in small devices
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithCustomButton(
            title: 'Recommended',
            buttonText: 'More',
            onPressed: () => {print('Press More')},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CustomCard(
                  title: 'Plant Motherfuck 1',
                  price: 50.00,
                  imgURL: 'https://dummyimage.com/150x250/fff/aaa',
                  subtitle: 'Motherloop',
                  onPressed: () => {print('tap')},
                ),
                CustomCard(
                  title: 'Plant Motherfuck 2',
                  price: 50.00,
                  imgURL: 'https://dummyimage.com/150x250/fff/aaa',
                  subtitle: 'Motherloop',
                  onPressed: () => {print('tap')},
                ),
                CustomCard(
                  title: 'Plant Motherfuck 3',
                  price: 50.00,
                  imgURL: 'https://dummyimage.com/150x250/fff/aaa',
                  subtitle: 'Motherloop',
                  onPressed: () => {print('tap')},
                ),
                CustomCard(
                  title: 'Plant Motherfuck 4',
                  price: 50.00,
                  imgURL: 'https://dummyimage.com/150x250/fff/aaa',
                  subtitle: 'Motherloop',
                  onPressed: () => {print('tap')},
                ),
                CustomCard(
                  title: 'Plant Motherfuck 5',
                  price: 50.00,
                  imgURL: 'https://dummyimage.com/150x250/fff/aaa',
                  subtitle: 'Motherloop',
                  onPressed: () => {print('tap')},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final double price;
  final String? imgURL;
  final String? subtitle;
  final VoidCallback? onPressed;
  const CustomCard({
    Key? key,
    required this.title,
    required this.price,
    this.imgURL,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          left: defPadding,
          top: defPadding / 2,
          bottom: defPadding * 2.5,
        ),
        width: size.width / 4,
        child: Column(
          children: <Widget>[
            Card(
              elevation: 50.0,
              shadowColor: primaryColor.withOpacity(0.23),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: FutureBuilder<Widget>(
                      future: getImage(this.imgURL as String),
                      builder: (context, AsyncSnapshot<Widget> snapshot) {
                        if (snapshot.hasData) {
                          // Extracting data from snapshot object
                          return snapshot.data as Widget;
                        } else {
                          return Text('LOADING...');
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('${this.title}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(this.subtitle as String),
                    trailing: Text('\$ ${this.price.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

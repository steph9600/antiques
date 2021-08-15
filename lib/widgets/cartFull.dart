import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 135,
      width: MediaQuery.of(context).size.width * 0.95,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/chair.jpg',
                        bundle: DefaultAssetBundle.of(context)))),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10.0),
                    Flexible(
                      child: Text(
                        'Very beautiful antique chair',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32.0),
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.cancel_presentation,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.0),
                    Text('Price:'),
                    SizedBox(width: 5.0),
                    Text(
                      '15,000',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: themeChange.darkTheme
                              ? ColorsConsts.kHighlightColor
                              : Theme.of(context).accentColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Ship Free:',
                      style: TextStyle(
                          color: themeChange.darkTheme
                              ? Colors.white
                              : Theme.of(context).accentColor),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(7.5),
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 12.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xFFFDD835),
                          ColorsConsts.gradiendFEnd,
                        ], stops: [
                          0.0,
                          0.7
                        ])),
                        child: Text(
                          '4',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(7.5),
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

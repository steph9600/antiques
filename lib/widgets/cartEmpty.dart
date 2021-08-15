import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/emptycart.png'),
            fit: BoxFit.fill,
          )),
        ),
        Text(
          'Your Cart is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Looks like you didn't add anything to your cart",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themeChange.darkTheme
                    ? Theme.of(context).disabledColor
                    : ColorsConsts.subTitle,
                fontSize: 22,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 50.0),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Text(
                'Browse Store',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10.0),
                backgroundColor: MaterialStateProperty.all(
                    ColorsConsts.kHighlightColor.withOpacity(0.7)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Colors.brown)))),
          ),
        )
      ],
    );
  }
}

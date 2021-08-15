import 'package:flutter/material.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/widgets/cartEmpty.dart';
import 'package:shop_app/widgets/cartFull.dart';

class Cart extends StatelessWidget {
  static const String id = 'CartPage';

  @override
  Widget build(BuildContext context) {
    List products = [];
    return products.isNotEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart'),
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.delete_outline_rounded))
              ],
            ),
            body: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return CartFull();
                }),
            bottomSheet: checkoutSection(context),
          );
  }

  Widget checkoutSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(colors: [
                      Color(0xFFFDD835),
                      ColorsConsts.gradiendFEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ])),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 80),
            Text(
              'Total:',
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 5),
            Text(
              '60000',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

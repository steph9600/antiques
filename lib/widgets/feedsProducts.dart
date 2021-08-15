import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/productModel.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Product> _products = [
    Product(
        id: 'Antique',
        title: 'Finn Navian',
        description:
            'Beautiful 80s style antique chair to spice up your living spaces',
        price: 21500,
        imageURL: 'assets/images/anotherchair.jpg',
        productCategoryName: 'Chairs',
        quantity: 21,
        isFavourite: false),
    Product(
        id: 'Antiques',
        title: 'Bohemian',
        description:
            'Beautiful 80s style ottoman to spice up your living spaces',
        price: 16500,
        imageURL: 'assets/images/ottoman.jpg',
        productCategoryName: 'Ottoman',
        quantity: 12,
        isFavourite: true),
  ];

  List<Product> get products => _products;

  set products(List<Product> products) {
    _products = products;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(children: [
            itemCard(
                title: _products[0].title,
                imgPath: _products[0].imageURL,
                isFavorite: _products[0].isFavourite,
                description: _products[0].description,
                price: _products[0].price.toString())
          ])
        ],
      ),
    );
  }

  Widget itemCard(
      {required String title,
      required String imgPath,
      required bool isFavorite,
      required String description,
      required String price}) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 160.0,
        width: MediaQuery.of(context).size.width * 0.9,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 140.0,
              height: 160.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            SizedBox(width: 4.0),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 45.0),
                      GestureDetector(
                        child: Material(
                          elevation: isFavorite ? 0.0 : 2.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: isFavorite
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.white),
                            child: Center(
                              child: isFavorite
                                  ? Icon(Icons.favorite_border)
                                  : Icon(Icons.favorite, color: Colors.red),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      description,
                      //'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 60.0,
                          color: Color(0xff4d3200),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                              child: Text(
                                price,
                                //\$248',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 40.0,
                              width: 100.0,
                              color: Color(0xff996300),
                              child: Center(
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

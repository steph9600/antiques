import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/productModel.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/screens/productDetails.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: Color(0xff4d3200),
                height: 250,
                width: double.infinity,
              ),
              Positioned(
                bottom: 60.0,
                right: 100.0,
                child: Container(
                  height: 500.0,
                  width: 500.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250.0),
                      color: Color(0xff996300).withOpacity(0.2)),
                ),
              ),
              Positioned(
                bottom: 150.0,
                left: 200.0,
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Color(0xff996300).withOpacity(0.2)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(height: height * 0.05),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/default-user-photo-placeholder-profile-image.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 140.0),
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 40.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'What do you want to buy?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Material(
                      color: Colors.white,
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search,
                                  color: Color(0xff996300), size: 30.0),
                              contentPadding:
                                  EdgeInsets.only(left: 15.0, top: 15.0),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Color(0xff996300),
                              ))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              Center(
                child: Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 3.0,
                    child: Container(
                      height: 75.0,
                      color: Colors.white,
                      width: width,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CategoryTile(
                      imagePath: 'assets/images/sofas.png', subtitle: 'Sofas'),
                  CategoryTile(
                      imagePath: 'assets/images/wardrobe.png',
                      subtitle: 'Wardrobe'),
                  CategoryTile(
                      imagePath: 'assets/images/desks.png', subtitle: 'Desk'),
                  CategoryTile(
                      imagePath: 'assets/images/dressers.png',
                      subtitle: 'Dresser')
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return itemCard(
                    context: context,
                    title: productsList[index].title,
                    imgPath: productsList[index].imageURL,
                    isFavorite: productsList[index].isFavourite,
                    description: productsList[index].description,
                    price: productsList[index].price.toString());
              })
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  CategoryTile({required this.imagePath, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 75.0,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                )),
                image: DecorationImage(image: AssetImage(imagePath))),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}

Widget itemCard(
    {required BuildContext context,
    required String title,
    required String imgPath,
    required bool isFavorite,
    required String description,
    required String price}) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.id),
      child: Container(
        height: 160.0,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 160.0,
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
                    child: Container(
                      height: 60,
                      child: Text(
                        description,
                        //'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
    ),
  );
}

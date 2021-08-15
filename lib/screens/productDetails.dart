import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/colors.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';
import 'package:shop_app/screens/homePageTabs/favourites.dart';
import 'package:shop_app/widgets/feedsProducts.dart';

class ProductDetails extends StatefulWidget {
  static const id = 'productDetails';
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    String reason = '';
    int _current = 0;
    final List<String> imgList = [
      'assets/images/chair.jpg',
      'assets/images/anotherchair.jpg',
    ];

    CarouselController buttonCarouselController = CarouselController();
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Details')),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            child: CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.fill, width: 250)),
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 200.0,
                  reverse: false,
                  autoPlay: false,
                  pauseAutoPlayOnTouch: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged:
                      (int index, CarouselPageChangedReason reasonChange) {
                    setState(() {
                      _current = index;
                      reason = reasonChange.toString();
                    });
                  }),
              carouselController: buttonCarouselController,
            ),
          ),
          Positioned(
            left: 0.0,
            top: 150,
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 40.0,
              ),
              onPressed: () => buttonCarouselController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 150,
            child: IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 40.0,
              ),
              onPressed: () => buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            ),
          ),
          /*Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              )),*/
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 225),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.orangeAccent,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.orangeAccent,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        Container(
                          width: MediaQuery.of(context).size.width * 9,
                          child: Text(
                            'Name',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '25,000',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeState.darkTheme
                                ? ColorsConsts.gradiendFEnd
                                : ColorsConsts.subTitle,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 9,
                          child: Text(
                            'Description',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Beautiful antique salvaged Finn Avian chairs from the 1950s',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeState.darkTheme
                                ? ColorsConsts.gradiendFEnd
                                : ColorsConsts.subTitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity:',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).textSelectionColor,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              '12 left',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: themeState.darkTheme
                                    ? ColorsConsts.gradiendFEnd
                                    : ColorsConsts.subTitle,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Category:',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).textSelectionColor,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Antiques',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: themeState.darkTheme
                                    ? ColorsConsts.gradiendFEnd
                                    : ColorsConsts.subTitle,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: themeState.darkTheme ? Colors.black : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reviews',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textSelectionColor,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        'No reviews yet',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: themeState.darkTheme
                              ? ColorsConsts.gradiendFEnd
                              : ColorsConsts.subTitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Suggested Products',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Favourites();
                      }),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'BUY NOW',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.payment,
                            color: Colors.green,
                            size: 19,
                          )
                        ],
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).backgroundColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subTitle,
                    child: InkWell(
                      splashColor: ColorsConsts.favColor,
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_app/widgets/emptyWishlist.dart';
import 'package:shop_app/widgets/feedsProducts.dart';

class FavoritesPage extends StatelessWidget {
  static const String id = 'Favourites';

  @override
  Widget build(BuildContext context) {
    List wishList = [];
    return wishList.isNotEmpty
        ? Scaffold(
            body: Favourites(),
          )
        : Scaffold(
            body: WishlistEmpty(),
          );
  }
}

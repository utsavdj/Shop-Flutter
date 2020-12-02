import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavoritesOnly;

  ProductsGrid(this._showFavoritesOnly);

  @override
  Widget build(BuildContext context) {
    final _productsData = Provider.of<Products>(context);
    final _products =
        _showFavoritesOnly ? _productsData.favoriteItems : _productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: _products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (ctx) => _products[index],
        value: _products[index],
        child: ProductItem(
            // _products[index].id,
            // _products[index].title,
            // _products[index].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

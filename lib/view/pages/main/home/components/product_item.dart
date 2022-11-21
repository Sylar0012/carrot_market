import 'package:cached_network_image/cached_network_image.dart';
import 'package:carrot_market/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 135.0, // 줄 간격
        child: Row(
          children: [
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: product.urlToImage,
                width: 115,
                height: 115,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
            ),
          ],
        ));
  }
}


import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

import 'package:flowery/presentation/home/tabs/home/products/component/arrow_back_widget.dart';
import 'package:flowery/presentation/home/tabs/home/products/component/product_details_widget.dart';
import 'package:flutter/material.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, this.product});
  final BestSeller? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          ProductDetailsWidget(product: product,),
          ArrowBackWidget(context),
        ]),
      ),
    );
  }
}
import 'package:bloc_learning/features/home/bloc/home_bloc.dart';
import 'package:bloc_learning/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final HomeProductModel product;
  const ProductTileWidget({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  product.imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(product.description),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ " + product.price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
homeBloc.add(HomeProductWishListButtonClickedEvent(clickedProduct: product));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {
homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: product));
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

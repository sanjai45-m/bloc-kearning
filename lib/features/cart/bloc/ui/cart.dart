import 'package:bloc_learning/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_learning/features/cart/bloc/ui/cart_tile_widget.dart';
import 'package:bloc_learning/features/home/ui/product_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final cartSuccessState = state as CartSuccessState;
              return ListView.builder(
                itemCount: cartSuccessState.cartProducts.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                      cartBloc: cartBloc,
                      product: cartSuccessState.cartProducts[index]);
                },
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_learning/data/cart_items.dart';
import 'package:bloc_learning/data/grocery_data.dart';
import 'package:bloc_learning/data/wishlist_items.dart';
import 'package:bloc_learning/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeIntialEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonnavigateEvent>(homeWishListButtonnavigateEvent);
    on<HomeCartButtonnavigateEvent>(homeCartButtonnavigateEvent);
  }

  FutureOr<void> homeIntialEvent(
      HomeIntialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeSuccessState(GroceryData.groceryProducts
        .map((e) => HomeProductModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']))
        .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeproductItemWishListButtonClickedActionState());
    print('wishlist product clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartButtonClickedActionState());
    print('cart product clicked');
  }

  FutureOr<void> homeWishListButtonnavigateEvent(
      HomeWishListButtonnavigateEvent event, Emitter<HomeState> emit) {
    print('wishlist Navigate  button clicked');
    emit(HomeNavigateToWishListActionState());
  }

  FutureOr<void> homeCartButtonnavigateEvent(
      HomeCartButtonnavigateEvent event, Emitter<HomeState> emit) {
    print('cart product Navigate clicked');
    emit(HomeNavigateToCartListActionState());
  }
}

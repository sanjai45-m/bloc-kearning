part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeActionState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{
  final List<HomeProductModel> products;
  HomeSuccessState(this.products);
}
class HomeErrorState extends HomeState{}
class HomeNavigateToWishListActionState extends HomeActionState{}
class HomeNavigateToCartListActionState extends HomeActionState{}
class HomeproductItemWishListButtonClickedActionState extends HomeActionState{}
class HomeProductItemCartButtonClickedActionState extends HomeActionState{}

part of 'category_bloc.dart';

class CategoryState {
  final List<Categories> categories;

  CategoryState({required this.categories});
}

final class CategoryInitial extends CategoryState {
  CategoryInitial() : super(categories: []);
}

import 'package:all_events/controller/api_services/categories/api_calls.dart';
import 'package:all_events/model/categories/categories.dart';
import 'package:bloc/bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>((event, emit) async {
      emit(CategoryLoadingState(categories: []));
      final response = await CategoriesApiServices().getAllCategories();
      response.fold((error) {
        emit(CategoryState(categories: []));
      }, (success) {
        emit(CategoryState(categories: success));
      });
    });
  }
}

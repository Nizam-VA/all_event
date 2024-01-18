import 'package:all_events/model/categories/categories.dart';
import 'package:all_events/utils/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoriesApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseURL));

  Future<Either<String, List<Categories>>> getAllCategories() async {
    try {
      final response = await dio.get(ApiEndpoints.categories);
      if (response.statusCode == 200) {
        final body = response.data as List;
        List<Categories> categories =
            body.map((category) => Categories.fromJson(category)).toList();
        return right(categories);
      } else {
        return left('Data not accessed');
      }
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }
}

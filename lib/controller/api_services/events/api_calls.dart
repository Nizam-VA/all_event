import 'package:all_events/model/business/item.dart';
import 'package:all_events/utils/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EventApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseURL));

  Future<Either<String, List<Item>>> getAllEvents() async {
    try {
      final response = await dio.get(ApiEndpoints.all);
      if (response.statusCode == 200) {
        final body = response.data as Map<String, dynamic>;
        final result = body['item'] as List;
        List<Item> events = result.map((e) => Item.fromJson(e)).toList();
        return right(events);
      } else {
        return left('Data not accessed');
      }
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }
}

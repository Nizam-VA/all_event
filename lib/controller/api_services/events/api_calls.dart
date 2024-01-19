import 'package:all_events/model/business/item.dart';
import 'package:all_events/utils/urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EventApiServices {
  static String getEndPoint(String category) {
    switch (category) {
      case 'all':
        return ApiEndpoints.all;
      case 'music':
        return ApiEndpoints.music;
      case 'business':
        return ApiEndpoints.business;
      case 'sports':
        return ApiEndpoints.sports;
      case 'workshops':
        return ApiEndpoints.workshops;
      default:
        return '';
    }
  }

  Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseURL));

  Future<Either<String, List<Item>>> getAllEvents(String category) async {
    final endPoint = getEndPoint(category);
    try {
      final response = await dio.get(endPoint);
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

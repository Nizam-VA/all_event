import 'package:all_events/utils/urls.dart';
import 'package:dio/dio.dart';

class EventApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseURL));
}

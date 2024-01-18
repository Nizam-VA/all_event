import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'request.dart';

part 'business.g.dart';

@JsonSerializable()
class Business {
  Request? request;
  int? count;
  List<Item>? item;

  Business({this.request, this.count, this.item});

  factory Business.fromJson(Map<String, dynamic> json) {
    return _$BusinessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}

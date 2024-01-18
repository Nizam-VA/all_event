// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      venue: json['venue'] as String?,
      ids: json['ids'] as String?,
      type: json['type'] as String?,
      city: json['city'] as String?,
      edate: json['edate'] as int?,
      page: json['page'] as int?,
      keywords: json['keywords'] as String?,
      sdate: json['sdate'] as int?,
      category: json['category'] as String?,
      cityDisplay: json['city_display'] as String?,
      rows: json['rows'] as int?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'venue': instance.venue,
      'ids': instance.ids,
      'type': instance.type,
      'city': instance.city,
      'edate': instance.edate,
      'page': instance.page,
      'keywords': instance.keywords,
      'sdate': instance.sdate,
      'category': instance.category,
      'city_display': instance.cityDisplay,
      'rows': instance.rows,
    };

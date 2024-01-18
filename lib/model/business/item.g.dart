// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      eventId: json['event_id'] as String?,
      eventname: json['eventname'] as String?,
      eventnameRaw: json['eventname_raw'] as String?,
      ownerId: json['owner_id'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      thumbUrlLarge: json['thumb_url_large'] as String?,
      startTime: json['start_time'] as int?,
      startTimeDisplay: json['start_time_display'] as String?,
      endTime: json['end_time'] as int?,
      endTimeDisplay: json['end_time_display'] as String?,
      location: json['location'] as String?,
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      label: json['label'] as String?,
      featured: json['featured'] as int?,
      eventUrl: json['event_url'] as String?,
      shareUrl: json['share_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tickets: json['tickets'] == null
          ? null
          : Tickets.fromJson(json['tickets'] as Map<String, dynamic>),
      customParams: json['custom_params'] as List<dynamic>?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'event_id': instance.eventId,
      'eventname': instance.eventname,
      'eventname_raw': instance.eventnameRaw,
      'owner_id': instance.ownerId,
      'thumb_url': instance.thumbUrl,
      'thumb_url_large': instance.thumbUrlLarge,
      'start_time': instance.startTime,
      'start_time_display': instance.startTimeDisplay,
      'end_time': instance.endTime,
      'end_time_display': instance.endTimeDisplay,
      'location': instance.location,
      'venue': instance.venue,
      'label': instance.label,
      'featured': instance.featured,
      'event_url': instance.eventUrl,
      'share_url': instance.shareUrl,
      'banner_url': instance.bannerUrl,
      'score': instance.score,
      'categories': instance.categories,
      'tags': instance.tags,
      'tickets': instance.tickets,
      'custom_params': instance.customParams,
    };

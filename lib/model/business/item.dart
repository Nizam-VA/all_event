import 'package:json_annotation/json_annotation.dart';

import 'tickets.dart';
import 'venue.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: 'event_id')
  String? eventId;
  String? eventname;
  @JsonKey(name: 'eventname_raw')
  String? eventnameRaw;
  @JsonKey(name: 'owner_id')
  String? ownerId;
  @JsonKey(name: 'thumb_url')
  String? thumbUrl;
  @JsonKey(name: 'thumb_url_large')
  String? thumbUrlLarge;
  @JsonKey(name: 'start_time')
  int? startTime;
  @JsonKey(name: 'start_time_display')
  String? startTimeDisplay;
  @JsonKey(name: 'end_time')
  int? endTime;
  @JsonKey(name: 'end_time_display')
  String? endTimeDisplay;
  String? location;
  Venue? venue;
  String? label;
  int? featured;
  @JsonKey(name: 'event_url')
  String? eventUrl;
  @JsonKey(name: 'share_url')
  String? shareUrl;
  @JsonKey(name: 'banner_url')
  String? bannerUrl;
  double? score;
  List<String>? categories;
  List<String>? tags;
  Tickets? tickets;
  @JsonKey(name: 'custom_params')
  List<dynamic>? customParams;

  Item({
    this.eventId,
    this.eventname,
    this.eventnameRaw,
    this.ownerId,
    this.thumbUrl,
    this.thumbUrlLarge,
    this.startTime,
    this.startTimeDisplay,
    this.endTime,
    this.endTimeDisplay,
    this.location,
    this.venue,
    this.label,
    this.featured,
    this.eventUrl,
    this.shareUrl,
    this.bannerUrl,
    this.score,
    this.categories,
    this.tags,
    this.tickets,
    this.customParams,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

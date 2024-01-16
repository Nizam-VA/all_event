import 'package:all_events/model/ticket.dart';
import 'package:all_events/model/venue.dart';

class Event {
  final String eventId;
  final String eventname;
  final String eventnameRaw;
  final String ownerId;
  final String thumbUrl;
  final String thumbUrlLarge;
  final int startTime;
  final String startTimeDisplay;
  final int endTime;
  final String endTimeDisplay;
  final String location;
  final Venue venue;
  final String label;
  final int featured;
  final String eventUrl;
  final String shareUrl;
  final String bannerUrl;
  final double score;
  final List<String> categories;
  final List<String> tags;
  final Tickets tickets;
  final List<String> customParams;

  Event({
    required this.eventId,
    required this.eventname,
    required this.eventnameRaw,
    required this.ownerId,
    required this.thumbUrl,
    required this.thumbUrlLarge,
    required this.startTime,
    required this.startTimeDisplay,
    required this.endTime,
    required this.endTimeDisplay,
    required this.location,
    required this.venue,
    required this.label,
    required this.featured,
    required this.eventUrl,
    required this.shareUrl,
    required this.bannerUrl,
    required this.score,
    required this.categories,
    required this.tags,
    required this.tickets,
    required this.customParams,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'],
      eventname: json['eventname'],
      eventnameRaw: json['eventname_raw'],
      ownerId: json['owner_id'],
      thumbUrl: json['thumb_url'],
      thumbUrlLarge: json['thumb_url_large'],
      startTime: json['start_time'],
      startTimeDisplay: json['start_time_display'],
      endTime: json['end_time'],
      endTimeDisplay: json['end_time_display'],
      location: json['location'],
      venue: json['venue'],
      label: json['label'],
      featured: json['featured'],
      eventUrl: json['event_url'],
      shareUrl: json['share_url'],
      bannerUrl: json['banner_url'],
      score: json['score'],
      categories: json['categories'].cast<String>(),
      tags: json['tags'].cast<String>(),
      tickets: json['tickets'],
      customParams: json['customParams'],
    );
  }
}

Map<String, dynamic> toJson(Event event) {
  final Map<String, dynamic> data = {
    'event_id': event.eventId,
    'eventname': event.eventname,
    'eventname_raw': event.eventnameRaw,
    'owner_id': event.ownerId,
    'thumb_url': event.thumbUrl,
    'thumb_url_large': event.thumbUrlLarge,
    'start_time': event.startTime,
    'start_time_display': event.startTimeDisplay,
    'end_time': event.endTime,
    'end_time_display': event.endTimeDisplay,
    'location': event.location,
    'venue': event.venue,
    'label': event.label,
    'featured': event.featured,
    'event_url': event.eventUrl,
    'share_url': event.shareUrl,
    'banner_url': event.bannerUrl,
    'score': event.score,
    'categories': event.categories,
    'tags': event.tags,
    'tickets': event.tickets,
    'custom_params': event.customParams,
  };
  return data;
}

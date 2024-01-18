import 'package:json_annotation/json_annotation.dart';

part 'tickets.g.dart';

@JsonSerializable()
class Tickets {
  @JsonKey(name: 'has_tickets')
  bool? hasTickets;
  @JsonKey(name: 'ticket_url')
  String? ticketUrl;

  Tickets({this.hasTickets, this.ticketUrl});

  factory Tickets.fromJson(Map<String, dynamic> json) {
    return _$TicketsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}

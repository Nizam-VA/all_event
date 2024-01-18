// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tickets _$TicketsFromJson(Map<String, dynamic> json) => Tickets(
      hasTickets: json['has_tickets'] as bool?,
      ticketUrl: json['ticket_url'] as String?,
    );

Map<String, dynamic> _$TicketsToJson(Tickets instance) => <String, dynamic>{
      'has_tickets': instance.hasTickets,
      'ticket_url': instance.ticketUrl,
    };

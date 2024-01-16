class Tickets {
  final bool hasTickets;
  final String ticketUrl;

  Tickets({required this.hasTickets, required this.ticketUrl});

  factory Tickets.fromJson(Map<String, dynamic> json) {
    return Tickets(
      hasTickets: json['has_tickets'],
      ticketUrl: json['ticket_url'],
    );
  }

  Map<String, dynamic> toJson(Tickets tickets) {
    final Map<String, dynamic> data = {
      'has_tickets': tickets.hasTickets,
      'ticket_url': tickets.ticketUrl,
    };

    return data;
  }
}

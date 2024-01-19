part of 'events_bloc.dart';

class EventsState {
  final List<Item> events;
  EventsState({required this.events});
}

final class EventsInitial extends EventsState {
  EventsInitial() : super(events: []);
}

class EventLoadingState extends EventsState {
  EventLoadingState() : super(events: []);
}

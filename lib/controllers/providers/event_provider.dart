import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../database/event_db.dart';

class EventProvider with ChangeNotifier {
  List<Event> _list = [];

  List<Event> get list {
    return [..._list];
  }

  void addEvent(
    String name,
    String subName,
    String description,
    String location,
    String time,
    String date,
  ) {
    Event event = Event(
      id: UniqueKey().toString(),
      name: name,
      subName: subName,
      description: description,
      location: location,
      time: time,
      date: date,
    );
    _list.add(event);
    notifyListeners();

    EventDB.insert('events', {
      'id': event.id,
      'name': event.name,
      'description': event.description,
      'location': event.location,
      'time': event.time,
      'date': event.date,
    });
  }

  Future<void> updateEvent(Event updatedEvent) async {
    final eventIndex = _list.indexWhere(
      (event) => event.id == updatedEvent.id,
    );
    if (eventIndex >= 0) {
      Event event = Event(
        id: UniqueKey().toString(),
        name: updatedEvent.name,
        subName: updatedEvent.subName,
        description: updatedEvent.description,
        location: updatedEvent.location,
        time: updatedEvent.time,
        date: updatedEvent.date,
      );
      _list.add(event);
      notifyListeners();
    }
    EventDB.insert('events', {
      'id': updatedEvent.id,
      'name': updatedEvent.name,
      'subName': updatedEvent.subName,
      'description': updatedEvent.description,
      'location': updatedEvent.location,
      'time': updatedEvent.time,
      'date': updatedEvent.date,
    });
  }

  Future<void> deleteEvent(String id) async {
    await EventDB.delete('events', id);
    deleteEvent(id);
  }

  Future<void> getEvents() async {
    final eventList = await EventDB.getData('events');
    _list = eventList
        .map(
          (event) => Event(
            id: event['id'],
            name: event['name'],
            subName: event['subName'],
            description: event['description'],
            location: event['location'],
            time: event['time'],
            date: event['date'],
          ),
        )
        .toList();
    notifyListeners();
  }

  Event findById(String eventId) {
    return _list.firstWhere((event) => event.id == eventId);
  }

  void deleteById(String eventId) {
    Event event = _list.firstWhere((event) => event.id == eventId);
    _list.remove(event);
  }
}

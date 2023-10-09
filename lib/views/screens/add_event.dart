import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/views/screens/details_event.dart';
import 'package:to_do_task/views/screens/home.dart';

import '../../controllers/providers/event_provider.dart';
import '../../models/event.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  static const routeName = '/add-event';

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _form = GlobalKey<FormState>();

  var _event = Event(
    id: '',
    name: '',
    subName: '',
    description: '',
    location: '',
    time: '',
    date: '',
  );

  var _init = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_init) {
      final eventId = ModalRoute.of(context)!.settings.arguments;
      if (eventId != null) {
        final editingEvent =
            Provider.of<EventProvider>(context).findById(eventId as String);
        _event = editingEvent;
      }
    }
    _init = false;
  }

  Future<void> _saveForm() async {
    FocusScope.of(context).unfocus();
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      if (_event.id.isEmpty) {
        try {
          Provider.of<EventProvider>(context, listen: false).addEvent(
            _event.name,
            _event.subName,
            _event.description,
            _event.location,
            _event.time,
            _event.date,
          );
        } catch (error) {
          await showDialog<void>(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Xatolik!'),
                content: const Text('Event qo\'shishda xatolik sodir bo\'ldi.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        try {
          await Provider.of<EventProvider>(context, listen: false)
              .updateEvent(_event);
        } catch (e) {
          await showDialog<void>(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Xatolik!'),
                content: const Text(
                    'Eventni o\'zgartirishda xatolik sodir bo\'ldi.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }
      setState(() {
        _isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
                child: Image.asset(
                  'assets/icons/back.png',
                  height: 60,
                  width: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            initialValue: _event.name,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, event nomini kiriting.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _event = Event(
                                id: _event.id,
                                name: newValue!,
                                subName: _event.subName,
                                description: _event.description,
                                location: _event.location,
                                time: _event.time,
                                date: _event.date,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event sub name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            initialValue: _event.name,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, event sub nomini kiriting.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _event = Event(
                                id: _event.id,
                                name: _event.name,
                                subName: newValue!,
                                description: _event.description,
                                location: _event.location,
                                time: _event.time,
                                date: _event.date,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 140,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            initialValue: _event.description,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, izoh kiriting.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _event = Event(
                                id: _event.id,
                                name: _event.name,
                                subName: _event.subName,
                                description: newValue!,
                                location: _event.location,
                                time: _event.time,
                                date: _event.date,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 84,
                                child: TextFormField(
                                  initialValue: _event.location,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onSaved: (newValue) {
                                    _event = Event(
                                      id: _event.id,
                                      name: _event.name,
                                      subName: _event.subName,
                                      description: _event.description,
                                      location: newValue!,
                                      time: _event.time,
                                      date: _event.date,
                                    );
                                  },
                                ),
                              ),
                              const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event time',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            initialValue: _event.time,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, event vaqtini kiriting.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _event = Event(
                                id: _event.id,
                                name: _event.name,
                                subName: _event.subName,
                                description: _event.description,
                                location: _event.location,
                                time: newValue!,
                                date: _event.date,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            initialValue: _event.date,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, event sanasini kiriting.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _event = Event(
                                id: _event.id,
                                name: _event.name,
                                subName: _event.subName,
                                description: _event.description,
                                location: _event.location,
                                time: _event.time,
                                date: newValue!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () => _saveForm(),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

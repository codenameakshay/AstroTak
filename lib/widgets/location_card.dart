import 'package:astrotak/model/place_model.dart';
import 'package:astrotak/notifiers/panchang_notifier.dart';
import 'package:astrotak/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

class LocationCard extends StatefulWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  late DateTime createdAt;
  final DateFormat formatter = DateFormat('E, MMMM d, yyyy');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _locationController;
  late Place _place;

  @override
  void initState() {
    super.initState();
    createdAt = DateTime.now();
    _locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              title: Text(formatter.format(createdAt)),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      createdAt = value;
                    });
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value2) {
                      if (value2 != null) {
                        setState(() {
                          createdAt = DateTime(createdAt.year, createdAt.month,
                              createdAt.day, value2.hour, value2.minute);
                        });
                      }
                    });
                  }
                });
              },
              trailing: const Icon(Icons.calendar_today)),
          Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                children: [
                  TypeAheadFormField<Place>(
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search for a place',
                      ),
                      keyboardType: TextInputType.text,
                      controller: _locationController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    suggestionsCallback: (query) async {
                      final places =
                          locator<PanchangNotifier>().fetchLocation(query);
                      return places;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion.placeName),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (suggestion) {
                      _locationController.text = suggestion.placeName;
                      _place = suggestion;
                      locator<PanchangNotifier>()
                          .fetchPanchang(createdAt, suggestion);
                    },
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please select a city';
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        locator<PanchangNotifier>()
                            .fetchPanchang(createdAt, _place);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: SizedBox(
                          height: 68,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Get Panchang",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

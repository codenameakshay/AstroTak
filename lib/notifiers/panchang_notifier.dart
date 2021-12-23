import 'package:astrotak/model/panchang_model.dart';
import 'package:astrotak/model/place_model.dart';
import 'package:astrotak/services/panchang_service.dart';
import 'package:flutter/material.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';

class PanchangNotifier extends ChangeNotifier {
  final _panchangService = locator<PanchangService>();

  PanchangNotifier() {
    _panchangService.panchangStateStream.listen((event) {
      logger.v("product state updated to $event");
      notifyListeners();
    });
    _panchangService.locationStateStream.listen((event) {
      logger.v("location state updated to $event");
      notifyListeners();
    });
  }

  Stream<Panchang> get panchangStream => _panchangService.panchangStream;
  Panchang? get panchang => _panchangService.panchangStream.valueOrNull;

  Stream<PanchangState> get panchangStateStream =>
      _panchangService.panchangStateStream;
  PanchangState? get panchangState =>
      _panchangService.panchangStateStream.valueOrNull;

  Stream<List<Place>> get placesStream => _panchangService.locationStream;
  List<Place>? get places => _panchangService.locationStream.valueOrNull;

  Stream<LocationState> get placeStateStream =>
      _panchangService.locationStateStream;
  LocationState? get locationState =>
      _panchangService.locationStateStream.valueOrNull;

  Future<void> fetchPanchang(DateTime dateTime, Place place) async {
    await _panchangService.fetchPanchang(dateTime, place);
  }

  Future<void> fetchLocation(String query) async {
    await _panchangService.fetchLocation(query);
  }
}

import 'package:astrotak/model/panchang_model.dart';
import 'package:astrotak/model/place_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:astrotak/utils/dio_client.dart';
import 'package:rxdart/rxdart.dart';

enum PanchangState {
  loading,
  error,
  ready,
}

enum LocationState {
  loading,
  error,
  ready,
}

class PanchangService {
  final DioClient dioClient = DioClient();

  final _panchangStateSubject =
      BehaviorSubject<PanchangState>.seeded(PanchangState.ready);

  final _locationStateSubject =
      BehaviorSubject<LocationState>.seeded(LocationState.ready);

  ValueStream<PanchangState> get panchangStateStream =>
      _panchangStateSubject.stream;

  ValueStream<LocationState> get locationStateStream =>
      _locationStateSubject.stream;

  set panchangState(PanchangState v) => _panchangStateSubject.add(v);

  set locationState(LocationState v) => _locationStateSubject.add(v);

  final _panchangSubject = BehaviorSubject<Panchang>();

  final _locationSubject = BehaviorSubject<List<Place>>();

  ValueStream<Panchang> get panchangStream => _panchangSubject.stream;

  ValueStream<List<Place>> get locationStream => _locationSubject.stream;

  set panchang(Panchang v) => _panchangSubject.add(v);

  set location(List<Place> v) => _locationSubject.add(v);

  void dispose() {
    _panchangSubject.close();
    _panchangStateSubject.close();
    _locationSubject.close();
    _locationStateSubject.close();
  }

  Future<void> fetchPanchang(DateTime dateTime, Place place) async {
    panchangState = PanchangState.loading;
    try {
      final Panchang? panchang =
          await dioClient.postPanchang(dateTime: dateTime, place: place);
      if (panchang != null) _panchangSubject.add(panchang);
      panchangState = PanchangState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      panchangState = PanchangState.error;
    }
  }

  Future<Iterable<Place>> fetchLocation(String query) async {
    locationState = LocationState.loading;
    Iterable<Place> places = [];
    try {
      places = await dioClient.getPlaces(query: query);
      _locationSubject.add(places.toList());
      locationState = LocationState.ready;
      return places;
    } catch (e, s) {
      logger.e(e, e, s);
      locationState = LocationState.error;
      return places;
    }
  }
}

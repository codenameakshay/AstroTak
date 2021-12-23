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

class PanchangService {
  final DioClient dioClient = DioClient();

  final _panchangStateSubject =
      BehaviorSubject<PanchangState>.seeded(PanchangState.ready);

  ValueStream<PanchangState> get panchangStateStream =>
      _panchangStateSubject.stream;

  set panchangState(PanchangState v) => _panchangStateSubject.add(v);

  final _panchangSubject = BehaviorSubject<Panchang>();

  ValueStream<Panchang> get panchangStream => _panchangSubject.stream;

  set panchang(Panchang v) => _panchangSubject.add(v);

  void dispose() {
    _panchangSubject.close();
    _panchangStateSubject.close();
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
}

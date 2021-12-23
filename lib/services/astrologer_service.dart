import 'package:astrotak/constants/demo_products.dart';
import 'package:astrotak/model/astrologer_model.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:astrotak/utils/dio_client.dart';
import 'package:rxdart/rxdart.dart';

enum AstrologerState {
  loading,
  error,
  ready,
}

class AstrologerService {
  final DioClient dioClient = DioClient();

  final _astrologerStateSubject =
      BehaviorSubject<AstrologerState>.seeded(AstrologerState.ready);

  ValueStream<AstrologerState> get astrologerStateStream =>
      _astrologerStateSubject.stream;

  set astrologerState(AstrologerState v) => _astrologerStateSubject.add(v);

  final _astrologersSubject = BehaviorSubject<List<Astrologer>>();

  ValueStream<List<Astrologer>> get astrologersStream =>
      _astrologersSubject.stream;

  set astrologers(List<Astrologer> v) => _astrologersSubject.add(v);

  void dispose() {
    _astrologersSubject.close();
    _astrologerStateSubject.close();
  }

  Future<void> fetchAstrologers(String query, FilterRange filterRange) async {
    astrologerState = AstrologerState.loading;
    try {
      final List<Astrologer>? astrologers = await dioClient.getAstrologers();
      List<Astrologer> tempAstrologers = [];
      if (query == "" && astrologers != null) {
        tempAstrologers = astrologers;
      } else {
        if (astrologers != null) {
          tempAstrologers = astrologers
              .where((element) =>
                  (element.firstName
                          ?.toLowerCase()
                          .contains(query.toLowerCase()) ==
                      true) ||
                  (element.lastName
                          ?.toLowerCase()
                          .contains(query.toLowerCase()) ==
                      true))
              .toList();
        }
      }
      switch (filterRange) {
        case FilterRange.all:
          break;
        case FilterRange.experienceHtL:
          tempAstrologers
              .sort((a, b) => b.experience?.compareTo(a.experience ?? 0) ?? 0);
          break;
        case FilterRange.experienceLtH:
          tempAstrologers
              .sort((a, b) => a.experience?.compareTo(b.experience ?? 0) ?? 0);
          break;
        case FilterRange.priceHtL:
          tempAstrologers.sort((a, b) => ((b.minimumCallDurationCharges ?? 1) /
                  (b.minimumCallDuration ?? 1))
              .compareTo((a.minimumCallDurationCharges ?? 1) /
                  (a.minimumCallDuration ?? 1)));
          break;
        case FilterRange.priceLtH:
          tempAstrologers.sort((a, b) => ((a.minimumCallDurationCharges ?? 1) /
                  (a.minimumCallDuration ?? 1))
              .compareTo((b.minimumCallDurationCharges ?? 1) /
                  (b.minimumCallDuration ?? 1)));
          break;
        default:
          break;
      }
      _astrologersSubject.add(tempAstrologers);
      astrologerState = AstrologerState.ready;
    } catch (e, s) {
      logger.e(e, e, s);
      astrologerState = AstrologerState.error;
    }
  }
}

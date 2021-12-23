import 'package:astrotak/model/astrologer_model.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/services/astrologer_service.dart';
import 'package:flutter/material.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';

class AstrologerNotifier extends ChangeNotifier {
  final _astrologerService = locator<AstrologerService>();

  AstrologerNotifier() {
    _astrologerService.astrologerStateStream.listen((event) {
      logger.v("astrologer state updated to $event");
      notifyListeners();
    });
  }

  Stream<List<Astrologer>> get astrologerStream =>
      _astrologerService.astrologersStream;
  List<Astrologer>? get astrologers =>
      _astrologerService.astrologersStream.valueOrNull;

  Stream<AstrologerState> get astrologerStateStream =>
      _astrologerService.astrologerStateStream;
  AstrologerState? get astrologerState =>
      _astrologerService.astrologerStateStream.valueOrNull;

  Future<void> fetchAstrologers(String query, FilterRange filterRange) async {
    await _astrologerService.fetchAstrologers(query, filterRange);
  }
}

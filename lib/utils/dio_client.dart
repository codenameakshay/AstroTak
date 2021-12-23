import 'package:astrotak/model/astrologer_model.dart';
import 'package:astrotak/model/json_request_model.dart';
import 'package:astrotak/model/panchang_model.dart';
import 'package:astrotak/model/place_model.dart';
import 'package:astrotak/services/logger.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  static const _baseUrl = "https://www.astrotak.com/astroapi/api";

  Future<List<Astrologer>?> getAstrologers() async {
    List<Astrologer>? astrologers;
    try {
      Response astroData = await _dio.get(_baseUrl + '/agent/all');

      // logger.d('Astrologer Info: ${astroData.data}');

      final jsonReq = JSONRequest.fromJson(astroData.data);

      astrologers = jsonReq.data.map<Astrologer>((astro) {
        return Astrologer.fromJson(astro);
      }).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        logger.w('Dio error!');
        logger.w('STATUS: ${e.response?.statusCode}');
        logger.w('DATA: ${e.response?.data}');
        logger.w('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        logger.w('Error sending request!');
        logger.w(e.message);
      }
    }
    return astrologers;
  }

  Future<Iterable<Place>> getPlaces({required String query}) async {
    Iterable<Place> places = const Iterable.empty();
    try {
      if (query != "") {
        Response placeData =
            await _dio.get(_baseUrl + '/location/place?inputPlace=$query');

        logger.d('User Info: ${placeData.data}');

        final jsonReq = JSONRequest.fromJson(placeData.data);

        places = jsonReq.data.map<Place>((astro) {
          return Place.fromJson(astro);
        });
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        logger.w('Dio error!');
        logger.w('STATUS: ${e.response?.statusCode}');
        logger.w('DATA: ${e.response?.data}');
        logger.w('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        logger.w('Error sending request!');
        logger.w(e.message);
      }
    }
    return places;
  }

  Future<Panchang?> postPanchang(
      {required DateTime dateTime, required Place place}) async {
    Panchang? retrievedPanchang;

    try {
      Response response = await _dio.post(
        _baseUrl + '/horoscope/daily/panchang',
        data: {
          "day": dateTime.day,
          "month": dateTime.month,
          "year": dateTime.year,
          "placeId": place.placeId,
        },
      );

      // logger.d('Panchang created: ${response.data}');
      final jsonReq = JSONRequest.fromJson(response.data);

      retrievedPanchang = Panchang.fromJson(jsonReq.data);
    } catch (e, s) {
      logger.e(e, e, s);
      logger.e('Error creating panchang: $e');
    }

    return retrievedPanchang;
  }
}

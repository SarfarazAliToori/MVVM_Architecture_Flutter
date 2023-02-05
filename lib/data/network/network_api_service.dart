import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_archetecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_archetecture/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiSevices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchedDataExceptions("No Internet Connection!");
    } catch (e) {
      throw e.toString();
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchedDataExceptions("Fetch Exception !");
    } catch (e) {
      throw e.toString();
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJsonBody = jsonDecode(response.body);
        return responseJsonBody;

      case 400:
        throw BedRequestExceptions("Bed Request ${response.body.toString()}");

      case 401:
        throw UnAuthorizedExceptions(
            "Unathorized Exception ${response.body.toString()}");
      case 500:
        throw InvalidInputExceptions("Invalid Exceptions.");

      default:
        throw FetchedDataExceptions(
            "Error in communication with server. \n with response code: ${response.statusCode.toString()}");
    }
  }
}

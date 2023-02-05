import 'package:flutter_mvvm_archetecture/data/network/base_api_service.dart';
import 'package:flutter_mvvm_archetecture/data/network/network_api_service.dart';
import 'package:flutter_mvvm_archetecture/res/api_url.dart';

class AuthRepository {
  BaseApiSevices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.postApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic registrationResponse =
          _apiServices.postApiResponse(AppUrl.regisrationEndPoint, data);
      return registrationResponse;
    } catch (e) {
      throw e;
    }
  }
}

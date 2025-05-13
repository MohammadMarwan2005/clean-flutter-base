import 'package:clean_flutter_base/data/api/api_service.dart';
import 'package:clean_flutter_base/data/api/safe_api_caller.dart';
import 'package:clean_flutter_base/domain/model/auth/auth_response.dart';
import 'package:clean_flutter_base/domain/model/resource.dart';
import 'package:clean_flutter_base/domain/model/auth/login_request.dart';

class AuthRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  AuthRepo(this._apiService, this._safeAPICaller);

  Future<Resource<AuthResponse>> login(LoginRequest request) async {
    return await _safeAPICaller<AuthResponse, AuthResponse>(
      apiCall: () {
        return _apiService.login(request);
      },
      dataToDomain: (data) {
        return data;
      },
    );
  }
}

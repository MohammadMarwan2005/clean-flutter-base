import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/model/auth/auth_response.dart';
import '../../domain/model/auth/login_request.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  @POST(ApiConstants.login)
  Future<AuthResponse> login(
      @Body() LoginRequest loginRequest,
      );

}

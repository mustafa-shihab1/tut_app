import 'package:tut_app/data/network/app_api.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthResponse> login(LoginRequest loginRequest);
}


class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async{

    return await _appServiceClient.login(
        loginRequest.email,
        loginRequest.password
    );
  }

}
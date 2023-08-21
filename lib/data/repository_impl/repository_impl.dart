import 'package:dartz/dartz.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/error_handler.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/network_info.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/domain/repository/repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try{
        final response = await _remoteDataSource.login(loginRequest);

        if(response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        }else{
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.UNKNOWN)
          );
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }

    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}


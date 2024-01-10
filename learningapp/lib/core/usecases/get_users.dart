import 'package:learningapp/core/usecases/usecase.dart';
import 'package:learningapp/core/utils/typedef.dart';
import 'package:learningapp/src/authentication/domain/entities/user.dart';
import 'package:learningapp/src/authentication/domain/repositoties/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>>{

  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call () async => _repository.getUsers();

}
import 'package:equatable/equatable.dart';
import 'package:learningapp/core/usecases/usecase.dart';
import 'package:learningapp/core/utils/typedef.dart';
import 'package:learningapp/src/authentication/domain/repositoties/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams > {

  const CreateUser(this._repository);

  final AuthenticationRepository _repository;
  
  @override
  ResultVoid(CreateUserParams params) async => _repository.createUser(
    createdAt: params.createdAt,
     name: params.name,
      avatar: params.avatar,
      );

  }


class CreateUserParams extends Equatable {


const CreateUserParams({
  required this.createdAt,
  required this.name,
  required this.avatar,
});


final String createdAt;
final String name;
final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];

}
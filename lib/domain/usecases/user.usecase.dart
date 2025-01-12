import 'package:flutter_application_1/data/datasource/repositories/user.repository.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';

class AuthenticateUserUseCase{
  final UserRepository _repository;

   AuthenticateUserUseCase({required UserRepository repository})
      : _repository = repository;

  Future<bool> call(String username, String password) {
    return _repository.authenticate(username, password);
  }

 Future<UserEntity?> register(String username, String password) async {
  final result = await _repository.registerUser(username, password);

  if (result.isNotEmpty) {
    return UserEntity(
      id: result['id'] ?? "",
      username: result['username'] ?? "",
      password: result['password'] ?? "",
    );
  }
  return null;
}

}

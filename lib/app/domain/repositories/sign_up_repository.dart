import 'package:mediquest/app/domain/inputs/sign_up.dart';
import 'package:mediquest/app/domain/responses/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}

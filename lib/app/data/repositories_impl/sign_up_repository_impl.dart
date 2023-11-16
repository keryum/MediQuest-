import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediquest/app/domain/inputs/sign_up.dart';
import 'package:mediquest/app/domain/repositories/sign_up_repository.dart';
import 'package:mediquest/app/domain/responses/sign_up_response.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;
  SignUpRepositoryImpl(this._auth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await userCredential.user!.updateDisplayName(
        "${data.name} ${data.lastname}",
      );
      createFirestoreDocumentForUser(userCredential.user);
      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(
        parseStringToSignUpError(e.code),
        null,
      );
    }
  }
}

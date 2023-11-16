import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mediquest/app/data/repositories_impl/account_repository_impl.dart';
import 'package:mediquest/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:mediquest/app/data/repositories_impl/preferences_repository_impl.dart';
import 'package:mediquest/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:mediquest/app/domain/repositories/account_repository.dart';
import 'package:mediquest/app/domain/repositories/authentication_repository.dart';
import 'package:mediquest/app/domain/repositories/preferences_repository.dart';
import 'package:mediquest/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDependencies() async {
  final preferences = await SharedPreferences.getInstance();
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
      facebookAuth: FacebookAuth.i,
    ),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
  Get.i.lazyPut<PreferencesRepository>(
    () => PreferencesRepositoryImpl(preferences),
  );
}

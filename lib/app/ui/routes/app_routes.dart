import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:mediquest/app/ui/answered_correctly.dart';
import 'package:mediquest/app/ui/pages/achievements/achievements_page.dart';
import 'package:mediquest/app/ui/pages/categories/histology/Histology.dart';
import 'package:mediquest/app/ui/pages/categories/biochemistry/biochemistry.dart';
import 'package:mediquest/app/ui/pages/categories/physiology/physiology.dart';
import 'package:mediquest/app/ui/pages/friends/friends_page.dart';
import 'package:mediquest/app/ui/pages/home/initial_page.dart';
import 'package:mediquest/app/ui/pages/categories/categories_page.dart';
import 'package:mediquest/app/ui/pages/login/login_page.dart';
import 'package:mediquest/app/ui/pages/register/register_page.dart';
import 'package:mediquest/app/ui/pages/reset_password/reset_password_page.dart';
import 'package:mediquest/app/ui/pages/splash/splash_page.dart';
import 'package:mediquest/app/ui/pages/store/store_page.dart';
import 'package:mediquest/app/ui/wrong_answer.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.HOME: (_) => const InitialPage(),
      Routes.CATEGORIES: (_) => const CategoriesPage(),
      Routes.FRIENDS: (_) => const FriendsPage(),
      Routes.ACHIEVEMENTS: (_) => const AchievementsPage(),
      Routes.HISTOLOGY: (_) => HistologyPage(),
      Routes.PHYSIOLOGY: (_) => PhysiologyPage(),
      Routes.BIOCHEMISTRY: (_) => BiochemistryPage(),
      /* Routes.BIOCHEMISTRYQUESTIONSPAGE: (_) =>
          const BiochemistryQuestionsPage(), */
      Routes.ANSWEREDCORRECTLYPAGE: (_) => const AnsweredCorrectlyPage(),
      Routes.WRONGANSWER: (_) => const WrongAnswer(),
      Routes.STORE: (_) => const Store(),
      Routes.LOGINPAGE: (_) => const LoginPage(),
      Routes.RESET_PASSWORD: (_) => const ResetPasswordPage(),
      Routes.REGISTER: (_) => const RegisterPage(),
      Routes.SPLASH: (_) => const SplashPage(),
    };

import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Auth/ResetPassword.dart';
import 'package:study_hub/View/Auth/ResetPassword/resetPassword1.dart';
import 'package:study_hub/View/Auth/login.dart';
import 'package:study_hub/View/Auth/otp.dart';
import 'package:study_hub/View/Auth/signup.dart';
import 'package:study_hub/View/BottomNavBar/bottomNavBar.dart';
import 'package:study_hub/View/EditProfile/editProfile.dart';
import 'package:study_hub/View/Help/help.dart';
import 'package:study_hub/View/NcertBooks/ncertBooks.dart';
import 'package:study_hub/View/Notes/notes.dart';
import 'package:study_hub/View/Notification/notification.dart';
import 'package:study_hub/View/PreviousYearPaper/pyPaper.dart';
import 'package:study_hub/View/Profile/Achievement/medalAchievement.dart';
import 'package:study_hub/View/Quiz/QuizLevels/QuizResult.dart';
import 'package:study_hub/View/Quiz/QuizLevels/quizInstruction.dart';
import 'package:study_hub/View/Quiz/QuizLevels/quizLevels.dart';
import 'package:study_hub/View/Quiz/QuizLevels/startQuiz.dart';
import 'package:study_hub/View/SearchPage/search.dart';
import 'package:study_hub/View/Tricks/Controller/Tricks.dart';
import 'package:study_hub/View/WeeklyContests/weeklyContests.dart';
import 'package:study_hub/View/selectCategory/selectCategory.dart';
import 'package:study_hub/View/splash.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
        GetPage(name: RouteName.signup, page: () => const Signup()),
        GetPage(name: RouteName.login, page: () => const Login()),
        GetPage(name: RouteName.signupOtp, page: () => SignupOtp()),
        GetPage(
            name: RouteName.resetPassword, page: () => const Resetpassword()),
        GetPage(name: RouteName.bottomNav, page: () => const Bottomnavbar()),
        GetPage(name: RouteName.search, page: () => const Search()),
        GetPage(
            name: RouteName.notifications,
            page: () => const NotificationAlert()),
        GetPage(name: RouteName.previousYear, page: () => const PYPaper()),
        GetPage(name: RouteName.quizsLevels, page: () => const Quizlevels()),
        GetPage(
            name: RouteName.quizInstruction,
            page: () => const Quizinstruction()),
        GetPage(name: RouteName.startQuiz, page: () => const StartQuiz()),
        GetPage(name: RouteName.quizResult, page: () => const Quizresult()),
        GetPage(name: RouteName.notes, page: () => const Notes()),
        GetPage(name: RouteName.ncertBook, page: () => const Ncertbooks()),
        GetPage(
            name: RouteName.achievment, page: () => const Medalachievement()),
        GetPage(name: RouteName.editProfile, page: () => const EditProfile()),
        GetPage(name: RouteName.helpScreen, page: () => const HelpScreen()),
        GetPage(name: RouteName.tricks, page: () => const Tricks()),
        GetPage(
            name: RouteName.weeklyContests, page: () => const WeeklyContests()),
        GetPage(
          name: RouteName.selectCategory,
          page: () => const selectCategory(),
        ),
        GetPage(
          name: RouteName.resetPassword1,
          page: () => const resetPassword1(),
        ),
      ];
}

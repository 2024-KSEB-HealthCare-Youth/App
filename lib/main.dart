import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/main_page.dart';
import 'screens/camera_screen.dart';
import 'screens/loading_page.dart';
import 'screens/recommendation.dart';
import 'screens/my_page.dart';
import 'screens/menu.dart';
import 'screens/past_log.dart';
import 'screens/edit_account.dart';
import 'screens/commentsScreen.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      runApp(ErrorApp());
      return;
    }
    final firstCamera = cameras.first;
    runApp(FigmaToCodeApp(camera: firstCamera));
  } catch (e) {
    runApp(ErrorApp());
  }
}

class ErrorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ErrorPage(message: 'No cameras available'),
        ),
      ),
    );
  }
}

class FigmaToCodeApp extends StatelessWidget {
  final CameraDescription camera;

  const FigmaToCodeApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(),
      home: SplashScreen(),
      routes: _buildRoutes(context),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: const TextStyle(color: Color(0xFF695B5B)),
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes(BuildContext context) {
    return {
      Routes.login: (context) => LogIn(),
      Routes.signUp: (context) => SignUp(),
      Routes.mainPage: (context) => MainPage(),
      Routes.takePictureScreen: (context) => takePictureScreen(camera: camera),
      Routes.loadingPage: (context) => LoadingScreen(imagePath: ""),
      Routes.recommendationPage: (context) => Recommendation(),
      Routes.myPage: (context) => MyPage(),
      Routes.menu: (context) => Menu(),
      Routes.pastLog: (context) => PastResultsScreen(),
      Routes.editAccount: (context) => EditAccountPage(),
      Routes.CommentsScreen: (context) => CommentsScreen(),
    };
  }
}

class Routes {
  static const String login = '/login';
  static const String signUp = '/sign_up';
  static const String mainPage = '/main_page';
  static const String takePictureScreen = '/camera_screen';
  static const String loadingPage = '/loading_page';
  static const String recommendationPage = '/recommendation_page';
  static const String myPage = '/my_page';
  static const String menu = '/menu';
  static const String pastLog = '/past_log';
  static const String editAccount = '/edit_account';
  static const String CommentsScreen = '/community';
}

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontSize: 18,
          color: Colors.red,
        ),
      ),
    );
  }
}

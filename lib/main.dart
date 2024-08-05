import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/login.dart';
import 'presentation/screens/sign_up.dart';
import 'presentation/screens/main_page.dart';
import 'presentation/screens/camera_screen.dart';
import 'presentation/screens/loading_page.dart';
import 'presentation/screens/recommendation.dart';
import 'presentation/screens/my_page.dart';
import 'presentation/screens/menu.dart';
import 'presentation/screens/past_log.dart';
import 'presentation/screens/edit_account.dart';
import 'presentation/screens/commentsScreen.dart';
import 'package:camera/camera.dart';
import 'services/like_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      runApp(ErrorApp());
      return;
    }
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LikeService()),
        ],
        child: FigmaToCodeApp(camera: frontCamera),
      ),
    );
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
      onGenerateRoute: _generateRoute,
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

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LogIn());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => SignUp());
      case Routes.mainPage:
        return MaterialPageRoute(builder: (context) => MainPage());
      case Routes.takePictureScreen:
        return MaterialPageRoute(
            builder: (context) => TakePictureScreen(camera: camera));
      case Routes.loadingPage:
        final args = settings.arguments as Map<String, dynamic>;
        final imagePath = args['imagePath'];
        return MaterialPageRoute(
            builder: (context) => LoadingScreen(imagePath: imagePath));
      case Routes.recommendationPage:
        return MaterialPageRoute(builder: (context) => Recommendation());
      case Routes.myPage:
        return MaterialPageRoute(builder: (context) => MyPage());
      case Routes.menu:
        return MaterialPageRoute(builder: (context) => Menu());
      case Routes.pastLog:
        return MaterialPageRoute(builder: (context) => PastResultsScreen());
      case Routes.editAccount:
        return MaterialPageRoute(builder: (context) => EditAccountPage());
      case Routes.CommentsScreen:
        return MaterialPageRoute(builder: (context) => CommentsScreen());
      default:
        return null;
    }
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
  static const String CommentsScreen = '/CommentsScreen';
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

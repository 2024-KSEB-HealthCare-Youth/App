import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/main_page.dart';
import 'screens/camera_screen.dart';
import 'screens/loading_page.dart';
import 'screens/diagnosis_page.dart';
import 'screens/recommendation.dart';
import 'screens/my_page.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      // Handle case where no cameras are available
      runApp(ErrorApp());
      return;
    }
    final firstCamera = cameras.first;
    runApp(FigmaToCodeApp(camera: firstCamera));
  } catch (e) {
    // Handle any errors during camera initialization
    runApp(ErrorApp());
  }
}

class ErrorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('No cameras available'),
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
      routes: {
        '/login': (context) => LogIn(),
        '/sign_up': (context) => SignUp(),
        '/main_page': (context) => MainPage(),
        '/camera_screen': (context) => CameraScreen(camera: camera),
        '/loading_page': (context) => LoadingPage(),
        '/diagnosis_page': (context) => DiagnosisPage(camera: camera),
        '/recommendation_page': (context) => Recommendation(),
        '/my_page': (context) => MyPage(),
      },
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
}

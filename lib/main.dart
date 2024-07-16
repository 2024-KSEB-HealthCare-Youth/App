import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'models/splash_screen.dart';
import 'models/login.dart';
import 'models/sign_up.dart';
import 'models/main_page.dart';
import 'models/camera_screen.dart';
import 'models/loading_page.dart';
import 'models/diagnosis_page.dart';
import 'models/recommendation.dart';
import 'models/my_page.dart';
import 'shared/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(FigmaToCodeApp(camera: firstCamera));
}

class FigmaToCodeApp extends StatelessWidget {
  final CameraDescription camera;

  const FigmaToCodeApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    UserData userData = UserData(); // Default values will be used here.

    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(color: Color(0xFF695B5B)),
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        ),
        textTheme: TextTheme(
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
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LogIn(),
        '/sign_up': (context) => SignUp(),
        '/main_page': (context) => MainPage(),
        '/camera_screen': (context) => CameraScreen(camera: camera),
        '/loading_page': (context) => LoadingPage(),
        '/diagnosis_page': (context) => DiagnosisPage(camera: camera),
        '/recommendation_page': (context) => Recommendation(
              userName : userData.name,
              skinType: userData.skintype,
            ),
        '/my_page': (context) => MyPage(
              profileImagePath: userData.profileImagePath,
              name: userData.name,
              nickName: userData.nickName,
              gender: userData.gender,
              age: userData.age,
              email: userData.email,
              phone: userData.phone,
            ),
      },
    );
  }
}

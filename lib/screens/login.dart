import 'package:flutter/material.dart';
import '../utils/rest_api.dart';
import '../models/user_data.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'email': '',
    'password': '',
  };

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final userData =
            await RestAPI.login(_formData['email']!, _formData['password']!);
        // Handle login success
        Navigator.pushNamed(context, '/main_page');
      } catch (e) {
        print('Login failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Log in to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 12,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Email',
                  onSaved: (value) => _formData['email'] = value!),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Password',
                  obscureText: true,
                  onSaved: (value) => _formData['password'] = value!),
              const SizedBox(height: 25),
              _buildLoginButton(context),
              const SizedBox(height: 25),
              _buildSignUpPrompt(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {required String labelText,
      bool obscureText = false,
      required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0D63D1),
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sign_up');
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFF2F89FC),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

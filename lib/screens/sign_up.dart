import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_data.dart';
import '../utils/rest_api.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _selectedGender = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthMonthController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      String birth =
          '${_birthMonthController.text.padLeft(2, '0')}/${_birthDayController.text.padLeft(2, '0')}/${_birthYearController.text}';

      // Calculate age
      int age;
      try {
        DateTime birthDate = DateFormat('MM/dd/yyyy').parse(birth);
        int calculatedAge = DateTime.now().year - birthDate.year;
        if (DateTime.now().isBefore(DateTime(
            birthDate.year + calculatedAge, birthDate.month, birthDate.day))) {
          calculatedAge--;
        }
        age = calculatedAge;
      } catch (e) {
        print('Birth date parsing failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Invalid birth date format. Please use MM/DD/YYYY.')),
        );
        return;
      }

      UserData userData = UserData(
        loginId: _loginIdController.text,
        password: _passwordController.text,
        name: _nameController.text,
        nickName: 'unKnown', // Default value for nickName
        gender: _selectedGender,
        age: age,
        phoneNumber: _phoneController.text,
        email: _emailController.text,
        profileImage:
            'default_profile_image.png', // Default value for profile image
        isAdmin: 'unKnown', // Default value for isAdmin
      );

      // Print JSON data to debug
      print('User data: ${userData.toJson()}');

      try {
        await RestAPI.signUp(userData);
        print('Sign up successful');
        Navigator.pushNamed(context, '/login');
      } catch (e) {
        print('Sign up failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _birthMonthController.dispose();
    _birthDayController.dispose();
    _birthYearController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Text(
                'Create an account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              const Text(
                'Manage Your Skin For Your Bright Future',
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
                labelText: 'Enter Your Login ID',
                controller: _loginIdController,
              ),
              const SizedBox(height: 25),
              _buildTextFormField(
                labelText: 'Enter Your Password',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 25),
              _buildTextFormField(
                labelText: 'Enter Your Username',
                controller: _nameController,
              ),
              const SizedBox(height: 25),
              const Text(
                'Choose Your Gender',
                style: TextStyle(
                  color: Color(0xFF000B14),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              _buildGenderSelectionButtons(),
              const SizedBox(height: 25),
              const Text(
                'Birth',
                style: TextStyle(
                  color: Color(0xFF000B14),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              _buildBirthDateFields(),
              const SizedBox(height: 25),
              _buildTextFormField(
                labelText: 'Enter Your Email',
                controller: _emailController,
              ),
              const SizedBox(height: 25),
              _buildTextFormField(
                labelText: 'Enter Your Phone Number',
                controller: _phoneController,
              ),
              const SizedBox(height: 25),
              _buildSignUpButton(context),
              const SizedBox(height: 25),
              _buildLoginPrompt(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String labelText,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildGenderSelectionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderButton(gender: 'MALE'),
        _buildGenderButton(gender: 'FEMALE'),
      ],
    );
  }

  Widget _buildGenderButton({required String gender}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedGender == gender ? Colors.blue : Colors.white,
        side: BorderSide(
          color: Colors.black.withOpacity(0.4),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        gender,
        style: TextStyle(
          color: _selectedGender == gender
              ? Colors.white
              : Colors.black.withOpacity(0.7),
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _buildBirthDateFields() {
    return Row(
      children: [
        Flexible(
          child: _buildTextFormField(
            labelText: 'MM',
            controller: _birthMonthController,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: _buildTextFormField(
            labelText: 'DD',
            controller: _birthDayController,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: _buildTextFormField(
            labelText: 'YYYY',
            controller: _birthYearController,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _signUp,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE26169),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          'Sign Up',
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

  Widget _buildLoginPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/main_page');
          },
          child: const Text(
            'Login',
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

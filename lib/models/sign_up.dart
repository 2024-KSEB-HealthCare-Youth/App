import 'package:flutter/material.dart';
import '../shared/user_data.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_selection_button.dart';
import '../widgets/birth_date_fields.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthMonthController = TextEditingController();
  final _birthDayController = TextEditingController();
  final _birthYearController = TextEditingController();

  String _selectedGender = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _birthMonthController.dispose();
    _birthDayController.dispose();
    _birthYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 61, horizontal: 40),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'Create an account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
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
            CustomTextField(
                labelText: 'Enter Your Username',
                controller: _usernameController),
            const SizedBox(height: 25),
            CustomTextField(
                labelText: 'Enter Your Nickname',
                controller: _nicknameController),
            const SizedBox(height: 25),
            Text(
              'Choose Your Gender',
              style: TextStyle(
                color: Color(0xFF000B14),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderSelectionButton(
                  gender: 'Male',
                  selectedGender: _selectedGender,
                  onGenderSelected: (gender) {
                    setState(() {
                      _selectedGender = gender;
                    });
                  },
                ),
                GenderSelectionButton(
                  gender: 'Female',
                  selectedGender: _selectedGender,
                  onGenderSelected: (gender) {
                    setState(() {
                      _selectedGender = gender;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              'Birth',
              style: TextStyle(
                color: Color(0xFF000B14),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            BirthDateFields(
              monthController: _birthMonthController,
              dayController: _birthDayController,
              yearController: _birthYearController,
            ),
            const SizedBox(height: 25),
            CustomTextField(
                labelText: 'Enter Your Email', controller: _emailController),
            const SizedBox(height: 25),
            CustomTextField(
                labelText: 'Enter Your Phone Number',
                controller: _phoneController),
            const SizedBox(height: 25),
            CustomTextField(
                labelText: 'Enter Your Password',
                obscureText: true,
                controller: _passwordController),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                final userData = UserData(
                  profileImagePath: 'assets/images/default_profile.png',
                  name: _usernameController.text,
                  nickName: _nicknameController.text,
                  gender: _selectedGender,
                  age:
                      '${_birthYearController.text}-${_birthMonthController.text}-${_birthDayController.text}',
                  email: _emailController.text,
                  phone: _phoneController.text,
                );
                await userData.saveUserData();
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D63D1),
                padding: EdgeInsets.symmetric(vertical: 12),
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
            ),
            const SizedBox(height: 25),
            Row(
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
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
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
            ),
          ],
        ),
      ),
    );
  }
}

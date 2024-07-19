import 'package:flutter/material.dart';
import '../utils/rest_api.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _selectedGender = '';
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'name': '',
    'nickname': '',
    'gender': '',
    'birth': '',
    'email': '',
    'phone': '',
    'password': ''
  };

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formData['gender'] = _selectedGender;

      try {
        await RestAPI.signUp(_formData);
        Navigator.pushNamed(context, '/login');
      } catch (e) {
        print('Sign up failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              _buildTextFormField(
                  labelText: 'Enter Your Username',
                  onSaved: (value) => _formData['name'] = value!),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Nickname',
                  onSaved: (value) => _formData['nickname'] = value!),
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
              _buildGenderSelectionButtons(),
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
              _buildBirthDateFields(),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Email',
                  onSaved: (value) => _formData['email'] = value!),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Phone Number',
                  onSaved: (value) => _formData['phone'] = value!),
              const SizedBox(height: 25),
              _buildTextFormField(
                  labelText: 'Enter Your Password',
                  obscureText: true,
                  onSaved: (value) => _formData['password'] = value!),
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

  Widget _buildGenderSelectionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderButton(gender: 'Male'),
        _buildGenderButton(gender: 'Female'),
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
                onSaved: (value) =>
                    _formData['birth'] = '${_formData['birth']}/${value}')),
        const SizedBox(width: 10),
        Flexible(
            child: _buildTextFormField(
                labelText: 'DD',
                onSaved: (value) =>
                    _formData['birth'] = '${_formData['birth']}/${value}')),
        const SizedBox(width: 10),
        Flexible(
            child: _buildTextFormField(
                labelText: 'YYYY',
                onSaved: (value) => _formData['birth'] = '${value}')),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _signUp,
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
    );
  }
}

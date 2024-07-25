// screens/edit_account_screen.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/user_data.dart';
import '../services/user_service.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  late TextEditingController _nameController;
  late TextEditingController _nickNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _ageController;
  late TextEditingController _genderController;

  File? _profileImage;
  UserData? _userData;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nickNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _ageController = TextEditingController();
    _genderController = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userId = args['userId'] as String;
    final accessToken = args['accessToken'] as String;

    try {
      UserData userData = await UserService().fetchUserData();
      setState(() {
        _userData = userData;
        _nameController.text = userData.name;
        _nickNameController.text = userData.nickName ?? '';
        _emailController.text = userData.email ?? '';
        _phoneController.text = userData.phoneNumber;
        _ageController.text = userData.age.toString();
        _genderController.text = userData.gender;
      });
    } catch (e) {
      print('Failed to load user data: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveAccountInfo() async {
    if (_userData == null) {
      return;
    }

    try {
      UserData updatedUserData = _userData!.copyWith(
        name: _nameController.text,
        nickName: _nickNameController.text,
        phoneNumber: _phoneController.text,
        email: _emailController.text,
        profileImage: _profileImage?.path ?? _userData!.profileImage,
      );

      // Update user data on the server
      await UserService().updateUserData(updatedUserData);

      print('User data and profile image updated successfully.');
    } catch (e) {
      print('Failed to save account info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
      ),
      body: _userData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : _userData!.profileImage != null
                                  ? NetworkImage(_userData!.profileImage!)
                                  : const AssetImage(
                                          'assets/images/sample_product.png')
                                      as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pink,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'User Information',
                    style: TextStyle(
                      color: Color(0xFFE57373),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _nickNameController,
                    labelText: 'Nickname',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _phoneController,
                    labelText: 'Phone',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _ageController,
                    labelText: 'Age',
                    enabled: false, // 나이 수정 불가
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _genderController,
                    labelText: 'Gender',
                    enabled: false, // 성별 수정 불가
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                      ),
                      onPressed: _saveAccountInfo,
                      child: const Text(
                        'save',
                        style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'Pacifico'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool enabled;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Arial',
        ),
      ),
      enabled: enabled,
    );
  }
}

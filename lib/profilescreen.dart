import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart'; // Uncommented for Firebase Auth
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Uncommented for Firestore

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; //instance variable
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Uint8List? _webImage; //list of 8 bit unsigned interger
  String? _email; // To store the user's email from Firebase Auth
  bool _isLoading = true; // To show loading state while fetching data

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the screen loads
  }

  // Fetch user data from Firestore
  Future<void> _fetchUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          final data = doc.data();
          setState(() {
            _email = user.email; // Get email from Firebase Auth
            usernameController.text = data?['username'] ?? '';
            nameController.text = data?['name'] ?? '';
            mobilenumberController.text = data?['mobilenumber'] ?? '';
            addressController.text = data?['address'] ?? '';
            if (data?['profilepic'] != null && data?['profilepic'].isNotEmpty) {
              try {
                // Decode base64 profile picture if it exists
                _webImage = base64Decode(
                  data?['profilepic'].replaceFirst(
                    'data:image/png;base64,',
                    '',
                  ),
                );
              } catch (e) {
                debugPrint('Error decoding profile picture: $e');
                _webImage = null;
              }
            }
            _isLoading = false;
          });
        } else {
          setState(() {
            _email = user.email;
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No user data found in Firestore.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not authenticated.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching user data: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Update user details in Firestore
  Future<void> updateUserDetails() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'username': usernameController.text.trim(),
          'name': nameController.text.trim(),
          'mobilenumber': mobilenumberController.text.trim(),
          'address': addressController.text.trim(),
          'updatedAt': Timestamp.now(),
          'profilepic':
              _webImage != null
                  ? 'data:image/png;base64,${base64Encode(_webImage!)}'
                  : '',
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not authenticated.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> pickImage() async {
    if (kIsWeb) {
      await pickImageWeb();
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes; // Store image bytes for both web and mobile
        });
        debugPrint("Selected Image Path: ${image.path}");
      } else {
        debugPrint("No image selected");
      }
    }
  }

  Future<void> pickImageWeb() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _webImage = bytes;
      });
    } else {
      debugPrint("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              _webImage != null
                                  ? MemoryImage(_webImage!)
                                  : const AssetImage(
                                        'assets/default_profile.png',
                                      )
                                      as ImageProvider,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: const Text('Change Profile Picture'),
                        ),
                        const SizedBox(height: 10),
                        // Email (non-editable)
                        TextFormField(
                          initialValue: _email ?? 'Not available',
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            enabled: false, // Make email non-editable
                          ),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: mobilenumberController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile Number',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length != 10) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              updateUserDetails(); // Update Firestore
                            }
                          },
                          child: const Text('Update Profile'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}

// import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/resourses/auth_method.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordlcontroller = TextEditingController();
  final TextEditingController _biolcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  Uint8List? _file;
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordlcontroller.dispose();
    _biolcontroller.dispose();
    _usernamecontroller.dispose();
  }

   void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _file = im;
    });
  }
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.maxFinite,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(),
                    fit: FlexFit.loose,
                    flex: 1,
                  ),
                  SvgPicture.asset(
                    "assets/ic_instagram.svg",

                    height: 70,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  Stack(children: [
                    _file != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_file!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://plus.unsplash.com/premium_photo-1673002094288-6c4456aa9098?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo)))
                  ]),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                      controller: _usernamecontroller,
                      hintText: "Enter your Username",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                      controller: _emailcontroller,
                      hintText: "Enter your email",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    controller: _passwordlcontroller,
                    hintText: "Enter your password",
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                      controller: _biolcontroller,
                      hintText: "Enter your bio",
                      textInputType: TextInputType.text),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: ()async {
                      String res= await AuthMethod().signUp(
                          email: _emailcontroller.text,
                          password: _passwordlcontroller.text,
                          username: _usernamecontroller.text,
                          bio: _biolcontroller.text,
                          file1: _file!,
                      );
                      print(res);
                      },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50.0),
                    ),
                    child: Text("SignUp"),
                  ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Container(),
                  // ),
                  Expanded(

                    child: TextButton(
                        onPressed: () {
                          _navigateToLoginScreen(context);
                        },

                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

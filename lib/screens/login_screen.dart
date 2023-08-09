import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/resourses/auth_method.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordlcontroller = TextEditingController();
  final TextInputType textInputType = TextInputType.emailAddress;
  bool isloading=false;
  Future<void> loginUser()async{
    setState(() {
      isloading=true;
    });
    String res= await AuthMethod().Login(email: _emailcontroller.text, passwd: _passwordlcontroller.text);
    if(res=='Successful login'){
      print(res);
    }
    else{
      showSnackbar(res, context);
    }
    setState(() {
      isloading=false;
    });

  }
  @override
  void dispose (){
    super.dispose();
    _emailcontroller.dispose();
    _passwordlcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SvgPicture.asset(
                  "assets/ic_instagram.svg",
                  color: primaryColor,
                  height: 50,
                ),
                const SizedBox(
                  height: 64,
                ),
                TextFieldInput(
                    controller: _emailcontroller,
                    hintText: "Enter your email",
                    textInputType: textInputType),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  controller: _passwordlcontroller,
                  hintText: "Enter your password",
                  textInputType: textInputType,
                  isPass: true,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: loginUser,
                  child: isloading?CircularProgressIndicator(color: Colors.white,):Text("Login"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50.0),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Create an account.",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        )),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

import 'package:clean_architecture/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/elevated_Button.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/social_media_signIn.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/span_text.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/text_form_field.dart';
import 'package:clean_architecture/utils/constants/route_names.dart';
import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: getWidth(context)*0.3,),
                Image.asset(
                  'assets/images/auth/Login_screen_image.png',
                  width: 100,
                ),
                const Text('Welcome Back'),
                const Text('Login to your account'),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  isPassword: false,
                  inputType: TextInputType.phone,
                  icon: CupertinoIcons.phone_fill,
                  hintText: 'Phone number',
                  controller: phoneNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                    inputType: TextInputType.name,
                    icon: Icons.lock_outlined,
                    hintText: 'Password',
                    isPassword: true,
                    controller: passwordController),
                const SizedBox(
                  height: 20,
                ),
                elevatedButton(text: 'Sign In', context: context, onTap: () {}),
                const SizedBox(
                  height: 15,
                ),
                const Text('forgot Password?'),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text('or Continue with')),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                socialMediaSignIn(context),
                const SizedBox(
                  height: 20,
                ),
                spanText(text:'Don\'t have an account? ',span: 'Sign Up',onTap: (){
                  context.pushNamed(Go.signUp);
                })
              ],
            ),
          ),
        ),
      )),
    );
  }
}

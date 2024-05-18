import 'package:clean_architecture/features/auth/presentation/pages/login_screen.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/continue_with_divider.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/elevated_Button.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/social_media_signIn.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/span_text.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/text_form_field.dart';
import 'package:clean_architecture/utils/constants/colors.dart';
import 'package:clean_architecture/utils/constants/route_names.dart';
import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/auth/Login_screen_image.png',
                  width: 100,
                )),
                const Text('Register'),
                const Text('Create Your New Account'),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  isPassword: false,
                  inputType: TextInputType.name,
                  icon: CupertinoIcons.person,
                  hintText: 'Full name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  isPassword: false,
                  inputType: TextInputType.phone,
                  icon: CupertinoIcons.phone,
                  hintText: 'Phone number',
                  controller: phoneNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                    inputType: TextInputType.name,
                    icon: Icons.location_on_outlined,
                    hintText: 'Locaiton',
                    isPassword: false,
                    controller: locationController),
                const SizedBox(
                  height: 20,
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
                FormContainerWidget(
                  inputType: TextInputType.name,
                  icon: Icons.lock_outlined,
                  hintText: 'Confirm Password',
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                elevatedButton(text: 'Sign Up', context: context, onTap: () {}),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                continueWithDivider(),
                const SizedBox(
                  height: 20,
                ),
                socialMediaSignIn(context),
                const SizedBox(
                  height: 20,
                ),
                spanText(
                    text: 'Already have an account?',
                    span: 'Sign In',
                    onTap: () {
                      context.pushNamed(Go.passwordLogin);
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }

  
}

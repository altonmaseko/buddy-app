import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';

import 'package:http/http.dart' as http;

import '../constants/image_strings.dart';
import '../constants/private_constants.dart';
import '../constants/sizes.dart';
import '../constants/texts.dart';
import '../utils/device_utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Password visibility flag
  bool _passwordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mode = TDeviceUtils.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: TSizes.defaultSpace,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon on top
              Image(
                height: 150,
                image: AssetImage(
                  mode ? TImages.people : TImages.people,
                ),
              ),

              // Welcome text
              Text(
                Texts.loginText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 5),

              // Subtitle
              Text(
                Texts.loginSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: Texts.email + ":",
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: 'Password:',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible ? Iconsax.eye : Iconsax.eye_slash,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          signInButton();
                        },
                        child: Text(Texts.SignIn),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup');
                        },
                        child: Text(Texts.CreateAcc),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInButton() async {
    showBottomMessage([CircularProgressIndicator()]);

    print("Sending registration request");

    String url = baseUrl + "login";
    final uri = Uri.parse(url);
    var body = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    final response = await http.post(uri, body: body);

    print("RESPONSE: ${response}");
    print("Status Code: ${response.statusCode}");

    print("Status Code: ${jsonDecode(response.body)['token']}");

    storeToken(jsonDecode(response.body)['token']);

    if (response.statusCode == 200) {
      print("LOGIN SUCCESSFUL");
      // show popup to check email
      Navigator.of(context).pop(); // remove loading
      Navigator.of(context).pushNamed('app');
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil('calenderpage', (route) => false);
    } else if (response.statusCode == 401) {
      // user already exists
      Navigator.of(context).pop(); // remove loading
      showBottomMessage([
        Text("Invalid email or password"),
      ]);
    } else {
      // something went wrong, try again later
      Navigator.of(context).pop(); // remove loading
      showBottomMessage([Text("Sorry, something went wrong.")]);
    }
  }

  void showBottomMessage(List<Widget> widgets) {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 40,
                  left: 40,
                  right: 40,
                  bottom: 40 + MediaQuery.of(context).viewInsets.bottom),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...widgets,
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> storeToken(String token) async {
    final secureStorage = FlutterSecureStorage();

    await secureStorage.write(key: "token", value: token);

    final t = await secureStorage.read(key: 'token');

    print("TOKEN: ${t}");
  }
}

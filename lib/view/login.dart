import 'package:flutter/material.dart';
import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/models/api_response.dart';
import 'package:flutter_testing/models/user.dart';
import 'package:flutter_testing/services/main_service.dart';
import 'package:flutter_testing/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool loading = false;
  bool isHidePassword = true;

  void loginUser() async {
    ApiResponse response = await login(usernameC.text, passC.text);

    try {
      if (response.error == null) {
        User user = response.data as User;
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('token', user.token ?? '');
        await pref.setInt('userId', user.id ?? 0);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeView()),
            (route) => false);
      } else {
        setState(() {
          loading = false;
        });
        alertdialog(
            err: response.error, context: context, desc: response.error);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: deviceWidth(context),
        height: deviceHeight(context),
        child: Column(
          children: [
            // container
            Container(
              padding: const EdgeInsets.all(50),
              width: deviceWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(right: 14),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/asset_sikep/logo.jpg"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sikep Mobile",
                        style: boldBlackFont.copyWith(fontSize: 24),
                      ),
                      Text(
                        "Modern Presence App",
                        style: regularGreyFont.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // expanded
            Expanded(
              child: Form(
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    TextFormField(
                      controller: usernameC,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          val!.isEmpty ? 'invalid email address' : null,
                      decoration: inputDecoration('NIP'),
                    ),
                    const SizedBox(height: defaultMargin),
                    TextFormField(
                      controller: passC,
                      obscureText: isHidePassword,
                      validator: (val) =>
                          val!.length < 6 ? 'Required at least 6 chars' : null,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isHidePassword = !isHidePassword;
                              });
                            },
                            child: (!isHidePassword)
                                ? const Icon(
                                    Icons.visibility_off,
                                    size: 20,
                                    color: primaryColor,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    size: 20,
                                    color: Color(0xFFC6C6C6),
                                  ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black))),
                    ),
                    const SizedBox(height: defaultMargin),
                    loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : kTextButton('Login', () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                                print(usernameC);
                                print(passC);
                              });
                              // loginUser();
                             Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()),
                                  (route) => false);
                            }
                          }, primaryColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

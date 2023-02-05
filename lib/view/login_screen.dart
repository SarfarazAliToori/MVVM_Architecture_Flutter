import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archetecture/res/components/round_button.dart';
import 'package:flutter_mvvm_archetecture/utils/app_utils.dart';
import 'package:flutter_mvvm_archetecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_archetecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  ValueNotifier _obsecurePassword = ValueNotifier(true);

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);
    final _height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email),
                ),
                focusNode: _emailFocusNode,
                onFieldSubmitted: (value) {
                  AppUtils.inputFieldNextFocuse(
                      context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              // TextFormField(
              //   controller: _password,
              //   obscureText: true,
              //   obscuringCharacter: "#",
              //   keyboardType: TextInputType.visiblePassword,
              //   decoration: InputDecoration(
              //     hintText: "Enter Password",
              //     labelText: "Password",
              //     prefixIcon: Icon(Icons.lock),
              //     // suffixIcon: Icon(Icons.visibility),
              //   ),
              //   focusNode: _passwordFocusNode,
              //   onFieldSubmitted: (value) {},
              // ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _password,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(
                height: _height * 0.07,
              ),
              RoundButton(
                title: "LogIn",
                loading: _authViewModel.loading,
                onPress: () {
                  if (_email.text.isEmpty) {
                    AppUtils.flushBar("Input Error",
                        "Please enter your email correctly", context);
                  } else if (_password.text.isEmpty) {
                    AppUtils.flushBar(
                        "Input Error", "Please enter your password", context);
                  } else if (_password.text.length < 6) {
                    AppUtils.flushBar("Input Error",
                        "Password must greater than 6 char", context);
                  } else {
                    Map data = {
                      "email": _email.text.toString(),
                      "password": _password.text.toString()
                    };
                    _authViewModel.loginApi(data, context);
                  }
                },
              ),
              SizedBox(
                height: _height * 0.03,
              ),
              RoundButton(
                title: "SignUp",
                loading: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

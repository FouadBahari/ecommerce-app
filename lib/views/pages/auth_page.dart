import 'package:ecommerce_app/utilities/enums.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _authType == AuthFormType.login ? 'Login' : 'Register',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter your email' : null,
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter your password' : null,
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 10),
                if (_authType == AuthFormType.register)
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your password' : null,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Confirm your password',
                    ),
                  ),
                const SizedBox(height: 10),
                if (_authType == AuthFormType.login)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot your password?'),
                      onTap: () {},
                    ),
                  ),
                const SizedBox(height: 24),
                MainButton(
                  text: _authType == AuthFormType.login ? 'Login' : 'Register',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint('Authenticated');
                      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    child: Text(_authType == AuthFormType.login
                        ? 'Don\'t have an account? Register'
                        : 'Already have an account? Login'),
                    onTap: () {
                      setState(() {
                        _formKey.currentState!.reset();
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _authType == AuthFormType.login
                        ? 'Or login with'
                        : 'Or Register with',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: const Icon(
                        Icons.facebook_outlined,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

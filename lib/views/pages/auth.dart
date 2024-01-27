import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilites/enums.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wigets/main_bottom.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                title: Text(
                  "Error!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("OK"))
            ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.authFormType == AuthFormType.login
                          ? "Login"
                          : "Register",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      textInputAction: TextInputAction.next,
                      focusNode: emailFocusNode,
                      controller: emailController,
                      onChanged: model.updateEmail,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your email' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      onChanged: model.updatePassword,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your password' : null,
                      decoration: const InputDecoration(
                        labelText: 'password',
                        hintText: 'Enter Your Password',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    if (model.authFormType == AuthFormType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: const Text(
                            'Forgot your password?',
                          ),
                          onTap: () {},
                        ),
                      ),
                    const SizedBox(height: 24),
                    MainBottom(
                      text: model.authFormType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          _submit(model);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'Don\'t have an account? Register'
                              : "Have an Account? Login",
                        ),
                        onTap: () {
                          formKey.currentState!.reset();
                          model.toggleFormType();
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * .22,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? "Or Login With"
                              : "Or Register With",
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}

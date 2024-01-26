import 'package:ecommerce/utilites/enums.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:flutter/material.dart';

import '../wigets/main_bottom.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  var authType = AuthFormType.login;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authType == AuthFormType.login ? "Login" : "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: emailController,
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
                controller: passwordController,
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
              if (authType == AuthFormType.login)
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
                text: authType == AuthFormType.login?'Login':'Register',
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child:  Text(
                    authType == AuthFormType.login? 'Don\'t have an account? Register':"Have an Account? Login",
                  ),
                  onTap: () {
                    setState(() {
                      if (authType == AuthFormType.login) {
                        authType = AuthFormType.register;
                        print(authType);
                      } else {
                        authType = AuthFormType.login;
                        print(authType);

                      }
                    });
                  },
                ),
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    authType == AuthFormType.login ? "Or Login With":"Or Register With",
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
      )),
    );
  }
}

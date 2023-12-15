import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../library/custom_text_field.dart';
import 'package:ti_3c_k2_ppm/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscured = true;
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> users = [
    {'email': 'admin@example.com', 'password': 'admin123', 'role': 'admin'},
    {
      'email': 'employee@example.com',
      'password': 'employee123',
      'role': 'employee'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Please Login!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 250,
                      width: 250,
                      child:
                          Image.asset('assets/images/login_illustration.png'),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: 'email',
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            label: 'password',
                            controller: _passwordController,
                            isObscure: isObscured ? true : false,
                            inputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                              icon: isObscured
                                  ? const Icon(Icons.visibility)
                                  : const Icon(
                                      Icons.visibility_off,
                                    ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Login'),
                              onPressed: () {
                                var navigator = Navigator.of(context);
                                if (_formKey.currentState!.validate()) {
                                  // Verifikasi login sederhana
                                  var foundUser = users.firstWhere(
                                    (user) =>
                                        user['email'] ==
                                            _emailController.text &&
                                        user['password'] ==
                                            _passwordController.text,
                                    orElse: () => {'role': ''},
                                  );

                                  if (foundUser['role']!.isNotEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    navigator.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return HomePage(
                                              role: foundUser['role']);
                                        },
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'Login failed, email or password is wrong!'),
                                    ));
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text('or'),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Sign Up as Admin'),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              var dt = DateTime.now();
                              var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
                              String formatted = formatter.format(dt);
                              print(formatted);
                              String a = formatter.parse(formatted).toString();
                              print('formart $formatted');
                            },
                            child: const Text('Coba'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

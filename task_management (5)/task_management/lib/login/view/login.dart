import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_management/home/view/home.dart';
import 'package:task_management/login/service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _passwordVisible = true;
  late Box box2;

  final _formKey = GlobalKey<FormState>();

  // Controllers for email and password fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox();
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF186565),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              color: const Color(0xFF186565),
              // Placeholder color
              child: const Padding(
                padding: EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0 * 3),
                    topRight: Radius.circular(10.0 * 3),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          buildEmailField(),
                          const SizedBox(height: 20),
                          buildPasswordField(),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forgot Password ?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color:
                                    Colors.blue, // Use your primary color here
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Navigator.of(context)
                                  //     .pushReplacement(MaterialPageRoute(
                                  //   builder: (context) => const HomeScreen(),
                                  // ));
                                  adddata(
                                      name: _emailController.text.trim(),
                                      password:
                                          _passwordController.text.trim());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red, // Use Colors.red for red color
                                foregroundColor: Colors.white, // Text color
                              ),
                              child: const Text('SIGN IN'),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: _emailController, // Assign email controller
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 12.0), // Adjust padding as needed
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        // You can add more styling as needed
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 12.0), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Password must be at least 5 characters';
        }
        return null;
      },
    );
  }

  Future<void> createBox() async {
    await Hive.initFlutter();
    box2 = await Hive.openBox("logindata");
  }

  Future<void> adddata({
    required String name,
    required String password,
  }) async {
    try {
      final response = await UserLogin(
        name: name,
        password: password,
      );
      if (response.data.first.status == "success") {
        box2.put("isLogged", true);
        box2.put("userlogin", false);
        box2.put("username", response.data.first.name);
        box2.put("id", response.data.first.id.toString());
        box2.put("email", response.data.first.email);
        print(response.data.first.email);
        print(response.data.first.name);
        print(response.data.first.id);
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sucessfull Login")));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to add data")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

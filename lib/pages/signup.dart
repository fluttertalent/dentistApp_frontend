import 'package:dentalcavity/utils/consts.dart';
import 'package:flutter/material.dart';
import '../tools/api.dart';
import 'package:intl/intl.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _secondnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String _errorMessage = '';
  List<String> userTypes = ['doctor', 'patient'];
  List<String> genders = ['Male', 'Female','Other'];
  String selectedUserType = 'patient';
  String selectedGender = 'M';
  DateTime selectedDate = DateTime.now();
  String dentalDisease = 'D';
  bool showRadioSection = true;

  // Add a function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _handleSignup() async {

    final firstname = _firstnameController.text;
    final secondname = _secondnameController.text;
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;


    final result = await signup(username, email, password, firstname, secondname, selectedUserType, selectedGender, DateFormat('yyyy-MM-dd').format(selectedDate), dentalDisease);

    if (result['success']) {
      print(result);
      showToast("Account Created");
      // Navigate to the home screen or do something else
      Navigator.pushReplacementNamed(context, '/');
    } else {
      setState(() {
        _errorMessage = result['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sign up'),
      // ),
      body:
      SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('resources/logo.png'),
              TextFormField(
                controller: _firstnameController,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "First Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _secondnameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Second Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration:InputDecoration(
                  labelText: "Email",
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                value: selectedUserType,
                decoration:InputDecoration(
                  labelText: "User Type",
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: userTypes.map((userType) {
                  return DropdownMenuItem(
                    value: userType,
                    child: Text(userType),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedUserType = value!;
                    showRadioSection = selectedUserType != 'doctor';

                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                value: selectedGender,
                decoration:InputDecoration(
                  labelText: "Gender",
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender=='Male'? 'M':gender=='Female'? 'F':'O',
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Birthday",
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
                onTap: () {
                  _selectDate(context);
                },
                controller: TextEditingController(
                    text: selectedDate == null ? '' : DateFormat('yyyy-MM-dd').format(selectedDate)),
              ),
              const SizedBox(
              height: 10,
            ),
              Visibility(
                  visible: showRadioSection,
                  child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Did you already have or have someone of this oral diseases?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: [
                            RadioListTile(
                              title: Text('Dental caries'),
                              value: 'D',
                              groupValue: dentalDisease,
                              onChanged: (value) {
                                setState(() {
                                  dentalDisease = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('Periodontitis'),
                              value: 'P',
                              groupValue: dentalDisease,
                              onChanged: (value) {
                                setState(() {
                                  dentalDisease = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text('Gingivitis'),
                              value: 'G',
                              groupValue: dentalDisease,
                              onChanged: (value) {
                                setState(() {
                                  dentalDisease = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
              ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _handleSignup();
                  }
                },
                child: const Text('Sign up'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("Already a member? Login"),
              ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

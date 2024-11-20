import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  bool emailisEmpty = false;

  final passwordController = TextEditingController();
  bool passwordisEmpty = false;
  String? passwordErrorText; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Sign in as staff?",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // logika
                  },
                  child: Text(
                    "Click Here",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0), // Jarak atas
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText: (emailisEmpty == false) ? null : "Field Email Kosong",
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                errorText: passwordErrorText,
                labelText: 'Password',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              obscureText: true,
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.green.shade700),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Tombol Login
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi Email nya ini
                  if (emailController.text.isEmpty) {
                    emailisEmpty = true;
                  } else {
                    emailisEmpty = false;
                  }

                  setState(() {
                    emailisEmpty;
                  });

                //  validasi pw nya ini tuh
                  if (passwordController.text.isEmpty) {
                    passwordisEmpty = true;
                    passwordErrorText = "Field Password Kosong";

                  } else if (passwordController.text.length < 6) {
                    passwordErrorText = "Minimal harus 6 karakter !";
                    passwordisEmpty = true;

                  } else {
                    passwordErrorText = null; 
                    passwordisEmpty = false;
                  }

                  setState(() {
                    passwordisEmpty;
                  });

                  String emailValue = emailController.text;
                  String passValue = passwordController.text;
                  print("emails $emailValue dan pass $passValue");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30.0),

            // Teks "atau login dengan"
            const Text(
              "or Login With",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(137, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 18.0),

            // Menampilkan Gambar Google Sign-In
            Image.asset(
              'assets/images/google_logo.png', // Pastikan gambar ada di folder assets
              height: 50, // Sesuaikan tinggi gambar
            ),
             const SizedBox(height: 19.0),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?"),
                Text(
                  " Register Here",
                  style: TextStyle(color: Colors.green.shade800),
                ),
              ],
             )
          ],
        ),
      ),
    );
  }
}

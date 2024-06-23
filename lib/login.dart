import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart'; // Import the RegisterPage
import 'recoder.dart'; // Import the RecorderPage

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void _loginWithEmailPassword() async {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        User? user = userCredential.user;

        if (user != null && user.emailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Successfully logged in: ${user.email}")),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecorderPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please verify your email before logging in.")),
          );
          // Send a verification email if not already sent
          if (user != null && !user.emailVerified) {
            await user.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Verification email sent. Please check your inbox.")),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to log in: ${e.message}")),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.blue, // Change to the color you desire
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.white], // Yellow and white colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Space above the image
            Image.asset(
              'assets/musik.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20), // Space between image and inputs
            // Email input
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Space between inputs
            // Password input
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Space between input and button
            // Login button
            ElevatedButton(
              onPressed: _loginWithEmailPassword,
              child: Text('Login'),
            ),
            SizedBox(height: 20), // Space between login and register buttons
            // Register button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

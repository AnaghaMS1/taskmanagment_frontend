import 'package:flutter/material.dart';

class ChangePwd extends StatelessWidget {
  const ChangePwd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text editing controllers for text fields
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmNewPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber, // Setting app bar background color
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title section
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Form section
            Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Current password text field
                      TextFormField(
                        controller: currentPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Current Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true, // Hides the entered text
                      ),
                      const SizedBox(height: 16.0),
                      // New password text field
                      TextFormField(
                        controller: newPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      // Confirm new password text field
                      TextFormField(
                        controller: confirmNewPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm New Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 30.0),
                      // Button to change password
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFF186565),
                          foregroundColor: Colors.white, 
                        ),
                        onPressed: () {
                          // Add logic to change the password
                        },
                        child: const Text('Change Password'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
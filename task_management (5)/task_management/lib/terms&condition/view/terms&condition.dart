import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF186565),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 20.0,
                    minRadius: 20.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.description,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Terms and Conditions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        " 1.Acceptance of Terms\n-By accessing or using the task management app for building construction, you agree to be bound by these terms and conditions, our privacy policy, and any other relevant guidelines.\n- If you do not agree with any part of these terms, you may not use the App.",
                      ),
                      Text(
                        "2 .User Responsibilities\n- You are solely responsible for the accuracy and legality of the information you input into the App.\n- You agree not to use the App for any illegal or unauthorized purpose.",
                      ),
                      Text(
                        "3.Data Privacy\n- We collect and process personal data in accordance with our privacy policy.\n- By using the App, you consent to the collection, use, and sharing of your data as described in our privacy policy.",
                      ),
                      Text(
                        "4.Intellectual Property\n- All content and materials provided in the App are owned by us or our licensors.\n- You may not reproduce, distribute, or modify any content from the App without prior written permission.",
                      ),
                      Text(
                        "5.Disclaimer of Warranties\n- The App is provided on an 'as is' and 'as available' basis without warranties of any kind.\n- We do not guarantee the accuracy, completeness, or reliability of the App.",
                      ),
                      Text(
                        "6.Limitation of Liability\n- We shall not be liable for any direct, indirect, incidental, special, or consequential damages arising from the use of the App.\n- Our total liability shall not exceed the amount paid by you, if any, for using the App.",
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

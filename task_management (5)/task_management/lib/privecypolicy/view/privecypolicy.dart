import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Color(0xFF186565),
      ),
      body:  Container(
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
                      Icons.privacy_tip,
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
                        "Privacy and Policy",
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
    'Privacy Policy',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
    SizedBox(height: 8.0),
    Text(
    'Effective Date: January 1, 2024',
    style: TextStyle(fontStyle: FontStyle.italic),
    ),
    SizedBox(height: 16.0),
    Text(
    'Welcome to ConstructionTaskManager!\n\n'
    'This Privacy Policy describes how ConstructionTaskManager ("we," "us," or "our") '
    'collects, uses, and shares information about you when you use our task management app '
    'and related services (collectively, the "Services").',
    textAlign: TextAlign.justify,
    ),
    SizedBox(height: 16.0),
    Text(
    'Information We Collect',
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8.0),
    Text(
    'Information You Provide to Us\n'
    'Account Information: When you create an account, we collect your name, email address, '
    'password, and other information you choose to provide.\n'
    'Profile Information: You may choose to provide additional information such as your profile '
    'picture, contact information, job title, and company details.\n'
    'Project Data: We collect information about construction projects you create or manage, '
    'including project descriptions, timelines, budget details, and assigned team members.\n'
    'Task Data: Information about tasks within projects, such as task descriptions, due dates, '
    'assigned team members, and task status updates.\n'
    'Feedback: If you submit feedback or contact us for support, we collect the content of your '
    'messages and any other information you provide.',
    textAlign: TextAlign.justify,
    ),
    SizedBox(height: 16.0),
    Text(
    'Information We Collect Automatically',
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8.0),
    Text(
    'Usage Data: We automatically collect usage data when you access and use the Services, '
    'including your IP address, device information, browser type, pages visited, and actions '
    'taken within the app.\n'
    'Log Data: Our servers automatically record log data generated by your use of the Services, '
    'which may include details of how you interact with our app, errors encountered, and system '
    'activity.\n'
    'Cookies and Similar Technologies: We use cookies and similar tracking technologies to '
    'personalize your experience, analyze trends, and track your use of the Services.',
    textAlign: TextAlign.justify,
    ),
    // Add more sections for each part of the Privacy Policy
    SizedBox(height: 16.0),
    Text(
    'Contact Us',
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 8.0),
    Text(
    'If you have any questions or concerns about our Privacy Policy or data practices, please '
    'contact us at privacy@constructiontaskmanager.com.',
    textAlign: TextAlign.justify,
    ),
    ],
    ),
    ),
    )
    )
          ]
    ),
    )
    )
    ;
  }
}
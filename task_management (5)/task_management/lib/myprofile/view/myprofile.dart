import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:task_management/changepwd/view/changepwd.dart';
import 'package:task_management/login/view/login.dart';
import 'package:task_management/myprofile/service/profile_service.dart';
import 'package:task_management/privecypolicy/view/privecypolicy.dart';
import 'package:task_management/terms&condition/view/terms&condition.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Box? box1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF186565),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF186565),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                future: profile_service(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 25,
                        ),
                      );
                    } else if (snapshot.data!.data.isNotEmpty) {
                      return Center(
                        child: ListView.builder(
                          itemCount: snapshot.data?.data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
   
  CircleAvatar(
    maxRadius: 40.0,
    minRadius: 40.0,
    backgroundColor: Colors.white,
    child: Text(
      snapshot.data!.data.isNotEmpty
          ? snapshot.data!.data.first.name[0].toUpperCase()
          : '',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

                                // const CircleAvatar(
                                //   maxRadius: 40.0,
                                //   minRadius: 40.0,
                                //   backgroundColor: Colors.white,
                                //   backgroundImage: AssetImage('assets/a.png'),
                                // ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.data.first.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.data.first.designation,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Email : ${snapshot.data!.data.first.email}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitRotatingCircle(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      "There is no bookings",
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  // CardListTile(
                  //   icon: Icons.lock,
                  //   title: 'Change Password',
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const ChangePwd(),
                  //       ),
                  //     );
                  //     // Handle password change
                  //   },
                  // ),
                  CardListTile(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage(),
                        ),
                      );
                      // Handle privacy policy
                    },
                  ),
                  CardListTile(
                    icon: Icons.description,
                    title: 'Terms and Conditions  ',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsConditionsPage(),
                        ),
                      );
                      // Handle terms and conditions
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () async {
                   box1?.put("isLogged", false);
                box1?.delete("username");
                box1?.delete("id");
                box1?.delete("name");
                box1?.delete("phone");
                box1?.delete("email");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CardListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

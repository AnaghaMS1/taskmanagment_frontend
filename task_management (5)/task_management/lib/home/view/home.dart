import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:task_management/feedback/view/feedback.dart';
import 'package:task_management/home/service/home%20_service.dart';
import 'package:task_management/home/widget/date.dart';
import 'package:task_management/leadbored/view/leadbored.dart';
import 'package:task_management/myprofile/view/myprofile.dart';
import 'package:task_management/mytask/view/mytask.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF186565),
      appBar: AppBar(
        backgroundColor: const Color(0xFF186565), // Custom app bar color
      ),
      body: Column(
        children: [
          // Top container showing user info and task summary
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: const Color(0xFF186565),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info and date
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      // Text(
                      //   "Anagha M S",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20.0,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DateViewer(),
                  const SizedBox(
                    height: 20,
                  ),
                  // Task summary cards
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder(
                        future: home_task_service(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              );
                            } else if (snapshot.data!.data.isNotEmpty) {
                              return ListView.builder(
                                itemCount: snapshot.data?.data.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      TaskCard(
                                        taskcount: snapshot
                                            .data!.data.first.task
                                            .toString(),
                                        title: "All Task",
                                        onPress: () {},
                                        backgroundColor:
                                            Colors.white.withOpacity(0.5),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      TaskCard(
                                        taskcount: snapshot
                                            .data!.data.first.pending
                                            .toString(),
                                        title: "upcoming",
                                        onPress: () {},
                                        backgroundColor: null,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      TaskCard(
                                        taskcount: snapshot
                                            .data!.data.first.ongoing
                                            .toString(),
                                        title: "Ongoing ",
                                        onPress: () {},
                                        backgroundColor: null,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      TaskCard(
                                        taskcount: snapshot
                                            .data!.data.first.completed
                                            .toString(),
                                        title: "Completed ",
                                        onPress: () {},
                                        backgroundColor:
                                            Colors.white.withOpacity(0.5),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                ],
              ),
            ),
          ),
          // Bottom container containing various options
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // First row of options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          backgroundColor:
                              const Color(0xFF186565).withOpacity(0.5),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyTask()));
                          },
                          icon: Icons.tab,
                          title: 'My Task',
                          subtitle: 'Your Task Allocated',
                        ),
                        HomeCard(
                          backgroundColor:
                              const Color(0xFF186565).withOpacity(0.5),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyProfile()));
                          },
                          icon: Icons.person,
                          title: 'My Profile',
                          subtitle: 'Your profile',
                        ),
                      ],
                    ),
                    // Second row of options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          backgroundColor:
                              const Color(0xFF186565).withOpacity(0.5),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FeedbackPage()));
                          },
                          icon: Icons.feedback,
                          title: 'Feedback',
                          subtitle: 'See all your feedback',
                        ),
                        HomeCard(
                          backgroundColor:
                              const Color(0xFF186565).withOpacity(0.5),
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Leaderboard()));
                          },
                          icon: Icons.auto_graph,
                          title: 'LeaderBoard',
                          subtitle: 'See your rank',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for individual option card
class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final VoidCallback onPress;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green.shade900, size: 25),
            Text(title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center),
            Text(subtitle,
                style: const TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Widget for task summary card
class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.taskcount,
    required this.title,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  final String taskcount;
  final String title;
  final VoidCallback onPress;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.8,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              taskcount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

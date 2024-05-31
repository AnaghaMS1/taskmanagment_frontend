import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_management/leadbored/service/leadbored.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF186565),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF186565),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                  child: Text(
                "Leaderboard",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FutureBuilder(
                  future: leaderbored_service(),
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
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.data.length,
                          itemBuilder: (context, index) {
                            final rank = index + 1;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                children: [
                                  Text(
                                    // Display rank here
                                    '$rank',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    snapshot.data!.data[index].employee,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 5),
                                        const RotatedBox(
                                          quarterTurns: 1,
                                          child: Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 187, 0),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          snapshot.data!.data[index].point,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
          ],
        ),
      ),
    );
  }
}

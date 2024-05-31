// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_management/started_task/service/complete_service.dart';
import 'package:task_management/started_task/service/started_task_service.dart';
import 'package:task_management/started_task/service/update_task.dart';
import 'package:task_management/started_task/widgets/CustomProgressbar.dart';

class StartedTaskCard extends StatefulWidget {
  const StartedTaskCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StartedTaskCard> createState() => _StartedTaskCardState();
}

class _StartedTaskCardState extends State<StartedTaskCard> {
  late double percentange = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: FutureBuilder(
          future: started_task_service(),
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
                  itemCount: snapshot.data?.data.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.47,
                            width: MediaQuery.of(context).size.width * 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child:
                                      // Left Side
                                      Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                        ' Task Name : ${snapshot.data!.data[index].taskName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Start Date : ${snapshot.data!.data[index].startDate}'),
                                      const SizedBox(height: 8),
                                      Text(
                                          'End Date : ${snapshot.data!.data[index].endDate}'),
                                      const SizedBox(height: 8),
                                      // Text(
                                      //     'Task Name : ${snapshot.data!.data[index].taskName}'),
                                      // const SizedBox(height: 8),
                                      Text(
                                          'Priority : ${snapshot.data!.data[index].priority}'),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Task Note ",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        snapshot
                                            .data!.data[index].taskDescription,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                        maxLines:
                                            2, // Set the maximum number of lines before overflow
                                        overflow: TextOverflow
                                            .ellipsis, // Set how to handle overflow
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          CustomProgressBar(
                                            width: 130,
                                            height: 20,
                                            // ignore: unnecessary_null_comparison
                                            progress: double.parse(snapshot
                                                        .data!
                                                        .data[index]
                                                        .progress) !=
                                                    null
                                                ? percentange
                                                : double.parse(snapshot.data!
                                                    .data[index].progress),
                                          ),
                                          FloatingActionButton(
                                            heroTag: null,
                                            mini: true,
                                            foregroundColor: Colors.black,
                                            backgroundColor: Colors.blue,
                                            onPressed: () {
                                              setState(() {
                                                percentange += 0.2;
                                              });
                                            },
                                            child: const Icon(Icons.add),
                                          ),
                                          FloatingActionButton(
                                            heroTag: null,
                                            mini: true,
                                            foregroundColor: Colors.black,
                                            backgroundColor: Colors.blue,
                                            onPressed: () {
                                              // hh
                                              addData(
                                                  id: snapshot
                                                      .data!.data[index].id,
                                                  percent: percentange);
                                            },
                                            child: const Icon(Icons.done),
                                          ),
                                          SizedBox(
                                            height: 35,
                                            width: 115,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(Colors
                                                            .blue), // Example color
                                              ),
                                              onPressed: () {
                                                // Add your onPressed function here
                                                completeData(
                                                  id: snapshot
                                                      .data!.data[index].id,
                                                );
                                              },
                                              child: const Text(
                                                'Complete',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),

                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.end,
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       CircularProgressIndicator(
                                  //         value: task.progress / 100,
                                  //         backgroundColor: Colors.grey,
                                  //         valueColor:
                                  //             const AlwaysStoppedAnimation<Color>(Colors.teal),
                                  //       ),
                                  //       const SizedBox(width: 8),
                                  //       Text(
                                  //         '${task.progress}%', // Convert progress to string
                                  //         style: const TextStyle(
                                  //           fontSize: 16,
                                  //         ),
                                  //       ),
                                  //       const SizedBox(height: 20),
                                  //       Text(
                                  //         task.status,
                                  //         style: const TextStyle(fontWeight: FontWeight.bold),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ),
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
                "There is no upcoming Task",
                style: TextStyle(fontSize: 15),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> addData({required int id, required double percent}) async {
    try {
      final response = await updatetask_service(task_id: id, percents: percent);
      if (response.data == "success") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successful")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to add data")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> completeData({required int id}) async {
    try {
      final response = await completetask_service(
        task_id: id,
      );
      if (response.data == "success") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successful")));
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

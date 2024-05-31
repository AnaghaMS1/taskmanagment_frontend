import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_management/completed_task/service/completed_task_service.dart';

class CompletedTaskCard extends StatefulWidget {
  const CompletedTaskCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedTaskCard> createState() => _CompletedTaskCardState();
}

class _CompletedTaskCardState extends State<CompletedTaskCard> {
  @override
  void initState() {
    super.initState();
    completed_task_service();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: FutureBuilder(
          future: completed_task_service(),
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
                            height: MediaQuery.of(context).size.height * .37,
                            width: MediaQuery.of(context).size.width * 3,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    // Left Side
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                 //   Text(
                                     //   'Task Name : ${snapshot.data!.data[index].taskName}'),
                                  //  const SizedBox(height: 8),
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
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.blue,
                                      ),
                                      child: Stack(
                                        children: [
                                          LinearPercentIndicator(
                                            lineHeight: 24.0,
                                            percent: 0.5,
                                            backgroundColor: Colors.transparent,
                                            progressColor: Colors.blue,
                                          ),
                                          const Center(
                                            child: Text(
                                              "100%",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "-------------------- Completed Task----------------------",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
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
                "There is no Completed Task",
                style: TextStyle(fontSize: 15),
              ),
            );
          },
        ),
      ),
    );
  }
}

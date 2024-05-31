import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_management/allocated_task/service/allocated_service.dart';
import 'package:task_management/allocated_task/service/start_service.dart';

class AllocatedTaskCard extends StatefulWidget {
  const AllocatedTaskCard({Key? key}) : super(key: key);

  @override
  _AllocatedTaskCardState createState() => _AllocatedTaskCardState();
}

class _AllocatedTaskCardState extends State<AllocatedTaskCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: allocatedtask_service(),
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
                  shrinkWrap: true,
                  itemCount: snapshot.data?.data.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .44,
                      width: MediaQuery.of(context).size.width * .3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                                  snapshot.data!.data[index].taskDescription,
                                  style: const TextStyle(color: Colors.blue),
                                  maxLines:
                                      2, // Set the maximum number of lines before overflow
                                  overflow: TextOverflow
                                      .ellipsis, // Set how to handle overflow
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .65,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        addData(
                                            id: snapshot.data!.data[index].id);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      child: const Text(
                                        'Start',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
              "There is no Task",
              style: TextStyle(fontSize: 15),
            ),
          );
        },
      ),
    );
  }

  Future<void> addData({required int id}) async {
    try {
      final response = await starttask_service(
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

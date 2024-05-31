import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:task_management/feedback/service/feedback_service.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  Future<void> _handleRefresh() async {
    // Simulating a refresh with a delay
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF186565),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: const Color(0xFF186565),
        height: 70,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        child: FutureBuilder(
          future: feedback_service(),
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
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Task Name:'),
                                Text(
                                  snapshot.data!.data[index].task.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8.0),
                            const Divider(),
                            const SizedBox(height: 8),
                            const Text('Feedback'),
                            const SizedBox(height: 4),
                            Text(
                              snapshot.data!.data[index].feedback,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    "There is no Feedback",
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitRotatingCircle(
                  color: Colors.red,
                  size: 50.0,
                ),
              );
            } else {
              // Return an empty container while waiting for data
              return Container();
            }
          },
        ),
      ),
    );
  }
}

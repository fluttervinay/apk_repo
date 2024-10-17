import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmp/provider/job_provider.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<JobProvider>(context,listen: false).getjobdata();
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Data'),
      ),
      body: Provider.of<JobProvider>(context).isloading?
      Center(child: CircularProgressIndicator(),):
      ListView.builder(
          itemCount: Provider.of<JobProvider>(context).jobModal.length,
          itemBuilder: (context, index) {
            final job=Provider.of<JobProvider>(context).jobModal[index];
            return ListTile(
              title: Text(job?.date??""),
              subtitle: Column(
                children: [
                  Text(job?.iBelieve??""),
                  Text(job?.finalPrayer??""),
                  Text(job?.gloryBe5??"")
                ],
              ),
            );
          },
      ),
    );
  }
}

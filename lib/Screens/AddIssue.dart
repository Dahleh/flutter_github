import 'package:flutter/material.dart';
import 'package:github/Helper/helperMethods.dart';
import 'package:github/Models/Repo.dart';
import 'package:github/dataProviders/appData.dart';
import 'package:provider/provider.dart';

class AddIssue extends StatefulWidget {
  static const String id = "AddIssue";
  @override
  _AddIssueState createState() => _AddIssueState();
}

class _AddIssueState extends State<AddIssue> {
  TextEditingController titleController = TextEditingController();
  TextEditingController issueController = TextEditingController();
  Repo repo;
  HelperMethods helperMethods = HelperMethods();
  void addIssue() async {
    if (titleController.text.isNotEmpty && issueController.text.isNotEmpty) {
      await helperMethods.addIssues(
          repo, titleController.text, issueController.text);

      Navigator.pop(context);
    } else {
      print("Fill the Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    repo = Provider.of<AppData>(context, listen: false).selectedRepo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Issue"),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: issueController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Issue",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                  onPressed: () {
                    addIssue();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

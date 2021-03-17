import 'package:flutter/material.dart';
import 'package:github/Models/Repo.dart';
import 'package:github/Screens/DetailPage.dart';
import 'package:github/dataProviders/appData.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const String id = "MainPage";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Repo> listOfRepo = [];
  void fetchData(context) {
    listOfRepo = Provider.of<AppData>(context, listen: false).listOfRepos;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Repositories'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listOfRepo.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Provider.of<AppData>(context, listen: false)
                    .updateSelectedRepo(listOfRepo[index]);
                Navigator.pushNamed(context, DetailPage.id);
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(listOfRepo[index].ownerAvatar),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listOfRepo[index].owner,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        listOfRepo[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
              ),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 8,
              //       ),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.verified_user,
              //             color: Colors.white,
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             listOfRepo[index].owner,
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           SizedBox(
              //             width: 8,
              //           ),
              //           Text(
              //             listOfRepo[index].name,
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //     ],
              //   ),
              // ),
            );
          },
        ),
      ),
    );
  }
}

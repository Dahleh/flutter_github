import 'package:flutter/material.dart';
import 'package:github/Helper/helperMethods.dart';
import 'package:github/Models/Repo.dart';
import 'package:github/Screens/MainPage.dart';
import 'package:github/dataProviders/appData.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String id = "Login";
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showTextFields = false;
  var emailController = TextEditingController();
  HelperMethods helperMethods = HelperMethods();
  List<Repo> list = [];

  var passwordController = TextEditingController();
  void login() async {
    if (emailController.text.isNotEmpty) {
      var data = await helperMethods.getAuth(
          emailController.text, passwordController.text);

      for (var item in data) {
        Repo repo = Repo(
            item['id'],
            item['name'],
            item['owner']['login'],
            item['owner']['avatar_url'],
            item['stargazers_count'],
            item['forks_count'],
            item['open_issues'],
            item['private']);
        list.add(repo);
      }
      Provider.of<AppData>(context, listen: false).updateRepoList(list);
      Navigator.pushNamed(context, MainPage.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Enter User Name'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showTextFields = false;
                    });
                  },
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzpUN6yhPjDbIPLhCSEXdnqaBqCj4IYrrbHw&usqp=CAU',
                    scale: 1.3,
                  ),
                ),
                SizedBox(height: 100),
                showTextFields ? textFields() : buttonSignin(),
              ],
            ),
          ),
        ));
  }

  Widget textFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Email Address",
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Password",
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
            onPressed: () {
              setState(() {
                login();
              });
            },
            child: Padding(
              padding:
                  EdgeInsets.only(right: 40.0, left: 40, top: 20, bottom: 20),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonSignin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
      onPressed: () {
        setState(() {
          showTextFields = true;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 40.0, left: 40, top: 20, bottom: 20),
        child: Text(
          "Sign in with GitHub",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

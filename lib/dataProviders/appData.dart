import 'package:flutter/cupertino.dart';
import 'package:github/Models/Repo.dart';

class AppData extends ChangeNotifier {
  List<Repo> listOfRepos;
  Repo selectedRepo;
  String userToken;

  void updateRepoList(List<Repo> list) {
    listOfRepos = list;
    notifyListeners();
  }

  void updateSelectedRepo(Repo repo) {
    selectedRepo = repo;
    notifyListeners();
  }

  void updateToken(String token) {
    userToken = token;
    notifyListeners();
  }
}

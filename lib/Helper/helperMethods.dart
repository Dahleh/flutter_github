import 'package:github/Models/Repo.dart';
import 'dart:convert';
import 'RequestHelper.dart';
import 'dart:async';

class HelperMethods {
  // final String _clientId = '3326a9de698232a081d5';
  // final String _clientSecret = 'b98fc2645d538823f438db8a2e704123cdacb51e';
  // String _getEncodedAuthorization(String username, String password) {
  //   final authorizationBytes = utf8.encode('${username}:${password}');
  //   return base64.encode(authorizationBytes);
  // }

  Future<dynamic> getAuth(String username, String password) async {
    Uri url = Uri.http(
      'api.github.com',
      '/users/$username/repos',
    );
    RequestHelper requestHelper = RequestHelper(url);
    List<dynamic> numberData = await requestHelper.getData();
    return numberData;
    // var basicToken = _getEncodedAuthorization(username, password);
    // final requestHeader = {'Authorization': 'basic ${basicToken}'};
    // final requestBody = json.encode({
    //   'client_id': _clientId,
    //   'client_secret': _clientSecret,
    //   'scopes': ['user', 'repo', 'notifications']
    // });
    // Uri url = Uri.https(
    //   'api.github.com',
    //   '/authorizations',
    // );
    // RequestHelper requestHelper = RequestHelper(url);
    // final loginResponse =
    //     await requestHelper.postData(requestHeader, requestBody);
    //
    // return loginResponse;
  }

  Future addIssues(Repo repo, String title, String issue) async {
    Uri url = Uri.https(
        'api.github.com', '/repos/${repo.owner}/${repo.name}/issues', {
      'Authorization': 'Bearer 5da4b27723eb8b7187f9420453a8952746e8daae',
      'Content-Type': 'application/json',
      'Accept': 'application/vnd.github.v3+json'
    });
    RequestHelper requestHelper = RequestHelper(url);

    print(await requestHelper.postData(title, issue));
  }
}

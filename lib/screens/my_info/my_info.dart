import 'package:flutter/material.dart';
import 'package:kai_friends_app/api/api_service.dart';

class MyInfoScreen extends StatefulWidget {
  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: apiService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
                "Something wrong with message: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          Profile profile = snapshot.data!;
          return Text(profile.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:kai_friends_app/screens/main/friend_filter.dart';
import 'package:kai_friends_app/widgets/friend_selection/friend_selection_view.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';

class UserRecommendationScreen extends StatelessWidget {
  final String getFriendRecommendationUrl =
      '/friendrecommendation'; // TODO: modify URL
  @override
  Widget build(BuildContext context) {
    // TODO: add filter button
    return Scaffold(
      appBar: TopAppBar(title: '', actions: [
        TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FriendFilterScreen()));
            },
            icon: const Icon(Icons.filter_list),
            label: const Text('필터')),
      ]),
      body: FriendSelectionView(
        getUserProfilesUrl: getFriendRecommendationUrl,
      ),
    );
  }
}

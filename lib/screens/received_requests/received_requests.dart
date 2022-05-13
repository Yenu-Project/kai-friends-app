import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/friend_selection/friend_selection_view.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';

class ReceivedRequestsScreen extends StatelessWidget {
  final String getReceivedRequestsUrl =
      '/receievedrequests'; // TODO: modify URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: '',
        actions: [],
      ),
      body: FriendSelectionView(
        getUserProfilesUrl: getReceivedRequestsUrl,
      ),
    );
  }
}

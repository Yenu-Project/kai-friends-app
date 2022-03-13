import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/friend_selection/friend_selection_view.dart';

class ReceivedRequestsScreen extends StatelessWidget {
  final String getReceivedRequestsUrl =
      '/receievedrequests'; // TODO: modify URL

  @override
  Widget build(BuildContext context) {
    return FriendSelectionView(
      getUserProfilesUrl: getReceivedRequestsUrl,
    );
  }
}

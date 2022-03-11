import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/friend_selection/friend_selection_view.dart';

class UserRecommendationScreen extends StatelessWidget {
  final String getFriendRecommendationUrl =
      '/friendrecommendation'; // TODO: modify URL
  @override
  Widget build(BuildContext context) {
    // TODO: add filter button
    return FriendSelectionView(
      getUserProfilesUrl: getFriendRecommendationUrl,
    );
  }
}

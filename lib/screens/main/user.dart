class UserProfile {
  String profileImage;
  String major;
  String year;
  String selfIntroduction;

  List<String> mentorPreference;
  List<String> majorPreference;
  List<String> classPreference;
  List<String> interestPreference;

  UserProfile({
    required this.profileImage,
    required this.major,
    required this.year,
    required this.selfIntroduction,
    required this.mentorPreference,
    required this.majorPreference,
    required this.classPreference,
    required this.interestPreference,
  });
}

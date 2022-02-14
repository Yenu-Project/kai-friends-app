class UserProfile {
  final String profileImage;
  final String major;
  final String year;
  final String selfIntroduction;

  final List<String> mentorPreference;
  final List<String> majorPreference;
  final List<String> classPreference;
  final List<String> interestPreference;

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

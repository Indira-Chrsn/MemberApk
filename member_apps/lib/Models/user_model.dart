class users {
  final int? userID;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final int dateOfBirth;
  final String userStatus;
  final int points;
  final int storeID;

  const users(
      {this.userID,
      required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.userStatus,
      required this.points,
      required this.storeID});

  factory users.fromJson(Map<String, dynamic> json) => users(
      userID: json['userID'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      userStatus: json['userStatus'],
      points: json['points'],
      storeID: json['storeID']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'userStatus': userStatus,
        'points': points,
        'storeID': storeID
      };
}

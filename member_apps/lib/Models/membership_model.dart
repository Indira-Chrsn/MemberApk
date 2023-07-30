class membership {
  final int? membershipID;
  final int? memberID;
  final int? storeID;
  final int joinDate;

  const membership(
      {required this.membershipID,
      required this.memberID,
      required this.storeID,
      required this.joinDate});

  factory membership.fromJson(Map<String, dynamic> json) => membership(
      membershipID: json['membershipID'],
      memberID: json['memberID'],
      storeID: json['storeID'],
      joinDate: json['joinDate']);

  Map<String, dynamic> toJson() => {
        'membershipID': membershipID,
        'memberID': memberID,
        'storeID': storeID,
        'joinDate': joinDate
      };
}

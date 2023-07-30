class store {
  final int? storeID;
  final String name;
  final String city;
  final String phoneNumber;
  final int? memberID;
  final int? member_amount;

  const store({
    required this.storeID,
    required this.name,
    required this.city,
    required this.phoneNumber,
    required this.memberID,
    required this.member_amount,
  });

  factory store.fromJson(Map<String, dynamic> json) => store(
        storeID: json['storeID'],
        name: json['name'],
        city: json['city'],
        phoneNumber: json['phoneNumber'],
        memberID: json['memberID'],
        member_amount: json['member_amount'],
      );

  Map<String, dynamic> toJson() => {
        'storeID': storeID,
        'name': name,
        'city': city,
        'phoneNumber': phoneNumber,
        'memberID': memberID,
        'member_amount': member_amount
      };
}

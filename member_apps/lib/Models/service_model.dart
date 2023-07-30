import 'package:flutter/material.dart';

class service {
  final int? serviceID;
  final int? userID;
  final int? storeID;
  final String status;
  final int startDate;
  final int? finishDate;

  const service(
      {required this.serviceID,
      required this.userID,
      required this.storeID,
      required this.status,
      required this.startDate,
      required this.finishDate});

  factory service.fromJson(Map<String, dynamic> json) => service(
      serviceID: json['serviceID'],
      userID: json['userID'],
      storeID: json['storeID'],
      status: json['status'],
      startDate: json['startDate'],
      finishDate: json['finishDate']);

  Map<String, dynamic> toJson() => {
        'serviceID': serviceID,
        'userID': userID,
        'storeID': storeID,
        'status': status,
        'startDate': startDate,
        'finishDate': finishDate
      };
}

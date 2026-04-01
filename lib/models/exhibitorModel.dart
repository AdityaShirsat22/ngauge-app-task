// To parse this JSON data, do
//
//     final exhibitorDetails = exhibitorDetailsFromJson(jsonString);

import 'dart:convert';

Exhibitormodel exhibitorDetailsFromJson(String str) =>
    Exhibitormodel.fromJson(json.decode(str));

String exhibitorDetailsToJson(Exhibitormodel data) =>
    json.encode(data.toJson());

class Exhibitormodel {
  String? code;
  String? message;
  List<Record>? records;

  Exhibitormodel({this.code, this.message, this.records});

  factory Exhibitormodel.fromJson(Map<String, dynamic> json) => Exhibitormodel(
    code: json["Code"],
    message: json["Message"],
    records: json["Records"] == null
        ? []
        : List<Record>.from(json["Records"]!.map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "Message": message,
    "Records": records == null
        ? []
        : List<dynamic>.from(records!.map((x) => x.toJson())),
  };
}

class Record {
  String? guid;
  String? exhibitorUserId;
  String? exhibitorBadgeNo;
  String? exhibitorId;
  String? stName;
  String? stCompany;
  String? stDesignation;
  String? stEmailId;
  String? stPassword;
  String? stMobileNo;
  String? stcountry;
  String? qrPath;

  Record({
    this.guid,
    this.exhibitorUserId,
    this.exhibitorBadgeNo,
    this.exhibitorId,
    this.stName,
    this.stCompany,
    this.stDesignation,
    this.stEmailId,
    this.stPassword,
    this.stMobileNo,
    this.stcountry,
    this.qrPath,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    guid: json["Guid"],
    exhibitorUserId: json["ExhibitorUserId"],
    exhibitorBadgeNo: json["ExhibitorBadgeNo"],
    exhibitorId: json["ExhibitorId"],
    stName: json["stName"],
    stCompany: json["stCompany"],
    stDesignation: json["stDesignation"],
    stEmailId: json["stEmailId"],
    stPassword: json["stPassword"],
    stMobileNo: json["stMobileNo"],
    stcountry: json["stcountry"],
    qrPath: json["QRPath"],
  );

  Map<String, dynamic> toJson() => {
    "Guid": guid,
    "ExhibitorUserId": exhibitorUserId,
    "ExhibitorBadgeNo": exhibitorBadgeNo,
    "ExhibitorId": exhibitorId,
    "stName": stName,
    "stCompany": stCompany,
    "stDesignation": stDesignation,
    "stEmailId": stEmailId,
    "stPassword": stPassword,
    "stMobileNo": stMobileNo,
    "stcountry": stcountry,
    "QRPath": qrPath,
  };
}

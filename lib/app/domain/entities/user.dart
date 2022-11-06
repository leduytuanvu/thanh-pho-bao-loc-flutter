import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart' as user_firebase;
import 'package:intl/intl.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/extensions/extensions.dart';
import 'package:thanh_pho_bao_loc/app/core/utils/export.dart';

class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? image;
  String? username;
  String? password;
  Status? status;
  DateTime? birthday;
  DateTime? lastSignIn;
  DateTime? createdAt;
  StatusAccount? statusAccount;
  Gender? gender;
  bool? signInByGoogle;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.image,
    this.username,
    this.password,
    this.status,
    this.birthday,
    this.lastSignIn,
    this.statusAccount,
    this.createdAt,
    this.gender,
    this.signInByGoogle,
  });

  User.fromJson(Map<String, dynamic> json, bool isTimeStamp) {
    log("${json['createdAt']} create date");
    DateTime datetimeCreateAt;
    if (isTimeStamp) {
      datetimeCreateAt = (json['createdAt'] as Timestamp).toDate();
      log("$datetimeCreateAt TRUE");
    } else {
      datetimeCreateAt =
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['createdAt']);
      log("$datetimeCreateAt FALSE");
    }

    DateTime dateTimeBirthday;
    if (json['birthday'] == null) {
      dateTimeBirthday = DateTime.now();
    } else {
      if (isTimeStamp) {
        dateTimeBirthday = (json['birthday'] as Timestamp).toDate();
        log("$dateTimeBirthday TRUE");
      } else {
        dateTimeBirthday =
            DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['birthday']);
        log("$dateTimeBirthday FALSE");
      }
    }

    DateTime dateTimeLastSignIn;
    if (json['lastSignIn'] == null) {
      dateTimeLastSignIn = DateTime.now();
    } else {
      if (isTimeStamp) {
        dateTimeLastSignIn = (json['lastSignIn'] as Timestamp).toDate();
        log("$dateTimeLastSignIn TRUE");
      } else {
        dateTimeLastSignIn =
            DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['lastSignIn']);
        log("$dateTimeLastSignIn FALSE");
      }
    }

    log("$datetimeCreateAt DATE TIME NE");
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    createdAt = datetimeCreateAt;
    username = json['username'];
    password = json['password'];
    status = json['status'].toString().stringToStatus;
    birthday = dateTimeBirthday;
    lastSignIn = dateTimeLastSignIn;
    signInByGoogle = json['signInByGoogle'];
    statusAccount = json['statusAccount'].toString().stringToStatusAccount;
    gender = json["gender"].toString().stringToGender;
  }

  factory User.fromFirebase(user_firebase.User user) {
    log("${DateTime.now().toString()} from firebase");
    return User(
      id: user.uid,
      email: user.email ?? "",
      fullName: user.displayName ?? user.email ?? "",
      phone: user.phoneNumber ?? "",
      image: user.photoURL ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      statusAccount: StatusAccount.active,
      birthday: null,
      gender: Gender.empty,
      lastSignIn: null,
      password: user.uid,
      status: Status.empty,
      username: user.uid,
      createdAt: DateTime.now(),
      signInByGoogle: true,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    // data['createdAt'] = dateFormat.format(createdAt!).toString();
    data['createdAt'] = createdAt!.toString();
    data['username'] = username;
    data['password'] = password;
    data['status'] = status!.statusToString;
    data['birthday'] = birthday != null ? null : null;
    data['lastSignIn'] = lastSignIn != null ? null : null;
    data['statusAccount'] = statusAccount!.statusAccountToString;
    data['gender'] = gender!.genderToString;
    data['signInByGoogle'] = signInByGoogle;
    log("${data['createdAt']} to map");
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['username'] = username;
    data['password'] = password;
    data['status'] = status!.statusToString;
    data['birthday'] = birthday;
    data['lastSignIn'] = lastSignIn;
    data['statusAccount'] = statusAccount!.statusAccountToString;
    data['gender'] = gender!.genderToString;
    data['signInByGoogle'] = signInByGoogle;
    log("${data['createdAt']} to json");
    return data;
  }
}

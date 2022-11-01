import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/core/extensions/extensions.dart';

class User {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? image;
  String? uid;
  String? username;
  String? password;
  Status? status;
  String? birthday;
  String? lastSeen;
  String? lastLogin;
  StatusAccount? statusAccount;
  Gender? gender;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.image,
    this.uid,
    this.username,
    this.password,
    this.status,
    this.birthday,
    this.lastSeen,
    this.lastLogin,
    this.statusAccount,
    this.gender,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    uid = json['uid'];
    username = json['username'];
    password = json['password'];
    status = json['status'].toString().stringToStatus;
    birthday = json['birthday'];
    lastSeen = json['lastSeen'];
    lastLogin = json['lastLogin'];
    statusAccount = json['statusAccount'].toString().stringToStatusAccount;
    gender = json["gender"].toString().stringToGender;
  }

  factory User.fromFirebase(firebase.User? user) {
    return User(
      id: user!.uid,
      email: user.email ?? "",
      fullName: user.displayName ?? "",
      phone: user.phoneNumber ?? "",
      image: user.photoURL ??
          "https://www.freeiconspng.com/thumbs/account-icon/account-icon-8.png",
      statusAccount: StatusAccount.active,
      birthday: "",
      gender: Gender.empty,
      lastLogin: "",
      lastSeen: "",
      password: "",
      status: Status.empty,
      uid: user.uid,
      username: "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['uid'] = uid;
    data['username'] = username;
    data['password'] = password;
    data['status'] = status!.statusToString;
    data['birthday'] = birthday;
    data['lastSeen'] = lastSeen;
    data['lastLogin'] = lastLogin;
    data['statusAccount'] = statusAccount!.statusAccountToString;
    data['gender'] = gender!.genderToString;
    return data;
  }
}

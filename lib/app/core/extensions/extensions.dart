import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';

extension StringX on String {
  Gender get stringToGender {
    var tmp = {
      "femail": Gender.femail,
      "male": Gender.male,
      "other": Gender.other,
      "empty": Gender.empty
    };
    return tmp[this] ?? Gender.empty;
  }

  Status get stringToStatus {
    var tmp = {
      "online": Status.online,
      "offline": Status.offline,
      "empty": Status.empty,
    };
    return tmp[this] ?? Status.empty;
  }

  StatusAccount get stringToStatusAccount {
    var tmp = {
      "active": StatusAccount.active,
      "inactive": StatusAccount.inactive,
      "blocked": StatusAccount.blocked,
      "deleted": StatusAccount.deleted,
    };
    return tmp[this] ?? StatusAccount.inactive;
  }
}

extension GenderX on Gender {
  String get genderToString => Gender.values[index].name;
}

extension StatusX on Status {
  String get statusToString => Status.values[index].name;
}

extension StatusAccountX on StatusAccount {
  String get statusAccountToString => StatusAccount.values[index].name;
}

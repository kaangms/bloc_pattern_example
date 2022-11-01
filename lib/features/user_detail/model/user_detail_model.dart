import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/network/INetworkModel.dart';

part 'user_detail_model.g.dart';

@JsonSerializable()
class UserDetailModel extends INetworkModel<UserDetailModel> {
  UserDetailModel({
    this.country,
    this.city,
    this.county,
    this.email,
    this.ip,
    this.phoneNumber,
    this.userid,
  });

  final String? country;
  final String? city;
  final String? county;
  final String? email;
  final String? ip;
  final String? phoneNumber;
  final String? userid;

  @override
  UserDetailModel fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserDetailModelToJson(this);
}

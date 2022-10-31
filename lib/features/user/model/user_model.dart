import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/network/INetworkModel.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.id,
  });

  final DateTime? createdAt;
  final String? name;
  final String? avatar;
  final String? id;

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserModelToJson(this);
}

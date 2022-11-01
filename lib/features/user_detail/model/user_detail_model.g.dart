// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      country: json['country'] as String?,
      city: json['city'] as String?,
      county: json['county'] as String?,
      email: json['email'] as String?,
      ip: json['ip'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userid: json['userid'] as String?,
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'county': instance.county,
      'email': instance.email,
      'ip': instance.ip,
      'phoneNumber': instance.phoneNumber,
      'userid': instance.userid,
    };

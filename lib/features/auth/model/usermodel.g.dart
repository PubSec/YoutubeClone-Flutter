// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      displayName: json['displayName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      videos: (json['videos'] as num).toInt(),
      userID: json['userID'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'username': instance.username,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'subscriptions': instance.subscriptions,
      'videos': instance.videos,
      'userID': instance.userID,
      'description': instance.description,
      'type': instance.type,
    };

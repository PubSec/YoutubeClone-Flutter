import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable(createToJson: true)
class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePicture;
  final List<String> subscriptions;
  final int videos;
  final String userID;
  final String description;
  final String type;

  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePicture,
    required this.subscriptions,
    required this.videos,
    required this.userID,
    required this.description,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

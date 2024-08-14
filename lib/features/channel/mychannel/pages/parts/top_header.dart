import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/model/usermodel.dart';

class TopHeaderWidget extends StatelessWidget {
  final UserModel user;
  const TopHeaderWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: const Color.fromARGB(255, 167, 157, 157),
            backgroundImage: CachedNetworkImageProvider(user.profilePicture),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 4),
          child: Text(
            user.displayName,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '${user.username} '),
                TextSpan(text: '${user.subscriptions.length} subscritpions'),
                TextSpan(text: '${user.videos}')
              ],
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

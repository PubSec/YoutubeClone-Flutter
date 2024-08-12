import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/core/error_page.dart';
import 'package:youtube_clone/core/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/youtube.jpg",
                  height: 36,
                ),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: Image.asset('assets/icons/cast.png'),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: Image.asset('assets/icons/notification.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: Image.asset(
                      "assets/icons/search.png",
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(currentUserProvider).when(
                          data: (currentUser) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                  currentUser.profilePicture),
                            ),
                          ),
                          error: (error, stackTrace) => const ErrorView(),
                          loading: () => const LoaderView(),
                        );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

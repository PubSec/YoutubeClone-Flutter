import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/core/error_page.dart';
import 'package:youtube_clone/core/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/mychannel/pages/parts/buttons.dart';
import 'package:youtube_clone/features/channel/mychannel/pages/parts/tabbar.dart';
import 'package:youtube_clone/features/channel/mychannel/pages/parts/top_header.dart';

class MyChannelView extends ConsumerWidget {
  const MyChannelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
        data: (currentUser) => DefaultTabController(
              length: 7,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        TopHeaderWidget(user: currentUser),
                        const Text('About.'),
                        const ButtonWidget(),
                        const TabBarWiget(),
                        const Expanded(
                          child: TabBarView(children: [
                            Center(child: Text('Home')),
                            Center(child: Text('Video')),
                            Center(child: Text('Shorts')),
                            Center(child: Text('Community')),
                            Center(child: Text('Playlist')),
                            Center(child: Text('Channel')),
                            Center(child: Text('About')),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        error: (error, stackTrace) => const ErrorView(),
        loading: () => const LoaderView());
  }
}

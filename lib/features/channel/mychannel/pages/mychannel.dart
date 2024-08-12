import 'package:flutter/material.dart';
import 'package:youtube_clone/colors.dart';
import 'package:youtube_clone/widgets/image_button.dart';

class MyChannelView extends StatelessWidget {
  const MyChannelView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: Color.fromARGB(255, 167, 157, 157),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 4),
                  child: Text(
                    'User Name',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: '@username  '),
                        TextSpan(text: 'No subsriptions '),
                        TextSpan(text: 'No videos')
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                const Text('About.'),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: softBlueGreyBackGround,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Manage Videos',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: 'pen.png',
                          haveColor: true,
                        ),
                      ),
                      Expanded(
                        child: ImageButton(
                          onPressed: () {},
                          image: 'time-watched.png',
                          haveColor: true,
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TabBar(
                    isScrollable: true,
                    labelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(top: 12),
                    tabs: [
                      Text('Home'),
                      Text('Videos'),
                      Text('Shorts'),
                      Text('Community'),
                      Text('Playlists'),
                      Text('Channel'),
                      Text('About'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

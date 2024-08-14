import 'package:flutter/material.dart';

class TabBarWiget extends StatelessWidget {
  const TabBarWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
    );
  }
}

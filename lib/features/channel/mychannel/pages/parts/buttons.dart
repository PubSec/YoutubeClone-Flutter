import 'package:flutter/material.dart';
import 'package:youtube_clone/colors.dart';
import 'package:youtube_clone/core/image_button.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}

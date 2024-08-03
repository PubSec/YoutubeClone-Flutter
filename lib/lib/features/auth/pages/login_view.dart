import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/authservice.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Image.asset('assets/images/youtube-signin.jpg'),
              ),
              const Text(
                'Welcome to Youtube',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: GestureDetector(
                  onTap: () {
                    ref.read(authServiceProvider).signInWithGoogle();
                  },
                  child: Image.asset('assets/images/signinwithgoogle.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

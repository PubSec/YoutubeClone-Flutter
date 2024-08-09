import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repository/userdataservice.dart';

final formKey = GlobalKey<FormState>();

class Usernameview extends ConsumerStatefulWidget {
  final String displayName;
  final String email;
  final String profilePicture;
  const Usernameview(this.displayName, this.email, this.profilePicture,
      {super.key});

  @override
  ConsumerState<Usernameview> createState() => _UsernameviewState();
}

class _UsernameviewState extends ConsumerState<Usernameview> {
  final TextEditingController userNameController = TextEditingController();
  bool isValid = true;

  void validateUsername() async {
    final userMap = await FirebaseFirestore.instance.collection('users').get();
    final users = userMap.docs.map((user) => user).toList();
    String? targetedUsername;
    for (var user in users) {
      if (userNameController.text == user.data()['username']) {
        targetedUsername = user.data()['username'];
        setState(() {
          isValid = false;
        });
      }
      if (userNameController.text != targetedUsername) {
        setState(() {
          isValid = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26,
                horizontal: 14,
              ),
              child: Text(
                'Enter a username here:',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Form(
                child: TextFormField(
                  onChanged: (username) {
                    validateUsername();
                  },
                  validator: (username) {
                    return isValid ? null : 'Username already taken';
                  },
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  controller: userNameController,
                  decoration: InputDecoration(
                      suffixIcon: isValid
                          ? const Icon(Icons.verified_user_rounded)
                          : const Icon(Icons.cancel),
                      suffixIconColor: isValid ? Colors.green : Colors.red,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintFadeDuration: const Duration(seconds: 1),
                      hintText: 'Input Username'),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: TextButton(
                onPressed: () async {
                  // add user data inside database
                  isValid
                      ? await ref
                          .read(userDataServiceProvider)
                          .addUserDataFirestore(
                            displayName: widget.displayName,
                            username: userNameController.text,
                            email: widget.email,
                            profilePicture: widget.profilePicture,
                            description: '',
                          )
                      : null;
                },
                style: ButtonStyle(
                  backgroundColor: isValid
                      ? const WidgetStatePropertyAll<Color>(Colors.green)
                      : WidgetStatePropertyAll<Color>(Colors.green.shade100),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

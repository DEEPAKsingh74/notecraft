import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notecraft/common/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 49, 49, 49),
            ),
          ),
          actions: [
            SizedBox(
              height: 10,
              child: Switch(
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                activeTrackColor: Colors.amber,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = !switchValue;
                  });
                },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 130,
                    height: 130,
                    color: const Color.fromARGB(255, 38, 38, 38),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileTile(
                      prefixIcon: FontAwesomeIcons.user,
                      title: "Deepak Singh",
                      subtitle: "username",
                    ),
                    ProfileTile(
                      prefixIcon: FontAwesomeIcons.envelope,
                      title: "Deepak74@gmail.com",
                      subtitle: "email",
                    ),
                    ProfileTile(
                      prefixIcon: FontAwesomeIcons.lock,
                      title: "************",
                      subtitle: "password",
                    ),
                    ProfileTile(
                      prefixIcon: FontAwesomeIcons.users,
                      title: "Invite Friends",
                      subtitle: "share",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

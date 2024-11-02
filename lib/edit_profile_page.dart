// edit_profile_page.dart
import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class EditProfilePage extends StatelessWidget {
  final UserProfile? user;

  EditProfilePage({this.user});

  @override
  Widget build(BuildContext context) {
    final pictureUrl = user?.pictureUrl;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pictureUrl != null)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: CircleAvatar(
                  radius: 56,
                  child: ClipOval(child: Image.network(pictureUrl.toString())),
                ),
              ),
            Card(
              child: Column(
                children: [
                  UserEntryWidget(propertyName: 'Id', propertyValue: user?.sub),
                  UserEntryWidget(propertyName: 'Name', propertyValue: user?.name),
                  UserEntryWidget(propertyName: 'Family name', propertyValue: user?.familyName),
                  UserEntryWidget(propertyName: 'Email', propertyValue: user?.email),
                  UserEntryWidget(
                      propertyName: 'Email Verified?',
                      propertyValue: user?.isEmailVerified.toString()),
                  UserEntryWidget(propertyName: 'Phone number', propertyValue: user?.phoneNumber),
                  UserEntryWidget(
                    propertyName: 'Phone Verified!?',
                    propertyValue: user?.isPhoneNumberVerified.toString(),
                  ),
                  UserEntryWidget(
                      propertyName: 'Updated at',
                      propertyValue: user?.updatedAt?.toIso8601String()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserEntryWidget extends StatelessWidget {
  final String propertyName;
  final String? propertyValue;

  const UserEntryWidget(
      {required this.propertyName, required this.propertyValue, final Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(propertyName), Text(propertyValue ?? '')],
        ));
  }
}

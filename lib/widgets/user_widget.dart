import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class UserWidget extends StatelessWidget {
  final UserProfile? user;

  const UserWidget({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user?.pictureUrl != null)
          CircleAvatar(
            radius: 56,
            backgroundImage: NetworkImage(user!.pictureUrl!.toString()),
          ),
        ListTile(title: Text('Id'), subtitle: Text(user?.sub ?? '')),
        ListTile(title: Text('Name'), subtitle: Text(user?.name ?? '')),
        ListTile(title: Text('Email'), subtitle: Text(user?.email ?? '')),
        ListTile(
          title: Text('Email Verified?'),
          subtitle: Text(user?.isEmailVerified.toString() ?? ''),
        ),
      ],
    );
  }
}

import 'package:all_events/controller/auth_service/auth_service.dart';
import 'package:all_events/controller/blocs/root/root_bloc.dart';
import 'package:all_events/view/screen/authentication/screen_authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final AuthService authService = AuthService();

showDialogBox(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure to logout?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                final preferences = await SharedPreferences.getInstance();
                await preferences.setBool('LOGIN', false);

                context.read<RootBloc>().add(IndexChangerEvent(index: 0));
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ScreenAuthentication()),
                    (route) => false);
              },
            ),
          ],
        );
      });
}

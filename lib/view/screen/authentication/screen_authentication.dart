import 'package:all_events/controller/blocs/authentication/authentication_bloc.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/utils/text_styles.dart';
import 'package:all_events/view/screen/root/screen_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAuthentication extends StatelessWidget {
  const ScreenAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign In', style: heavyWhite),
            kHight20,
            const Text('Discover events, meet new people and make memories',
                style: semiBoldWhite, textAlign: TextAlign.center),
            kHight30,
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                } else if (state is AuthenticationSuccessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ScreenRoot()),
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<AuthenticationBloc>().add(GoogleSignInEvent());
                  },
                  child: Container(
                    height: height * .06,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: state is AuthLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  height: 30),
                              const Text('Sign In with Google',
                                  style: boldWhite)
                            ],
                          ),
                  ),
                );
              },
            ),
            kHight30,
            const Text(
                "By signing in, I agree to Allevent's Privacy policy \nand Terms of services",
                style: regularWhite,
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

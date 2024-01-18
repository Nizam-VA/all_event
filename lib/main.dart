import 'package:all_events/controller/blocs/authentication/authentication_bloc.dart';
import 'package:all_events/controller/blocs/category/category_bloc.dart';
import 'package:all_events/controller/blocs/events/events_bloc.dart';
import 'package:all_events/controller/blocs/grid_view/grid_view_bloc.dart';
import 'package:all_events/controller/blocs/profile/profile_bloc.dart';
import 'package:all_events/controller/blocs/root/root_bloc.dart';
import 'package:all_events/firebase_options.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/view/screen/authentication/screen_authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    setSize(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => RootBloc()),
        BlocProvider(create: (context) => EventsBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => GridViewBloc()),
      ],
      child: MaterialApp(
        title: 'All Events',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: false,
        ),
        home: ScreenAuthentication(),
      ),
    );
  }
}

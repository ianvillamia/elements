import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Game/game.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Game/protoGame.dart';
import 'package:mynewapp/home.dart';
import 'package:mynewapp/Screens/Lessons/lessonsHome.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Services/routing.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FluroRouter.setupRouter();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
        ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider()),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges)
      ],
      child: MaterialApp(
        //setup fluro
        onGenerateRoute: FluroRouter.router.generator,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.def,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Home();
    }

    //  return SignIn();
    return SignIn();
  }
}

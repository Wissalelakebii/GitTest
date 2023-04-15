import 'package:buvapp/firebase_options.dart';
import 'package:buvapp/screens/homepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:buvapp/constants/constants.dart';
import 'package:buvapp/cubits/cubits.dart';
import 'package:buvapp/screens/screens.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomePageCubit()),
          BlocProvider(create: (context) => BasketPageCubit(),),
          BlocProvider(create: (context) => FoodDetailPageCubit(),)
        ],
        child: MaterialApp(
          initialRoute: 'welcome_page',
          routes: {

            'welcome_page': (context) => WelcomePage(),//yapıldı
            'login_page': (context) => LoginPage(), //yapıldı
            'register_page': (context) => RegisterPage(), //yapıldı
            'basket_page':(context)=>BasketPage(),//yapılıyor
            'profile_page':(context)=>ProfilePage(),
            'homepage':(context)=>FoodsPage()
          },
          title: 'Delivery Food',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kScaffoldColor,
              textTheme: GoogleFonts.robotoMonoTextTheme()),
        ));
  }
}
// ignore_for_file: prefer_const_constructors



import 'package:eshop/controller/binding.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/screen/firebase/services/splash_screen.dart';
import 'package:eshop/widget/checkoutrpogresscircle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//        apiKey: "AIzaSyByeHKJUz8BeqbIbMjK0ExsWnUtoxBm1LU",
//         // authDomain: "ecommerce-578b9.firebaseapp.com",
//         projectId: "ecommerce-578b9",
//         // storageBucket: "ecommerce-578b9.appspot.com",
//         messagingSenderId: "851137586958",
//         appId: "1:851137586958:web:1b7b709f6f62c93d3dd95f",
//         // measurementId: "G-VTM9S50H8Q"

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCcHIfll8IKNwc1mENWp3Ld2nkSCzA3gEE",
          appId: "1:103205150055:web:e8000437f07c85f48123c2",
          messagingSenderId: "103205150055",
          projectId: 'eshop-2dec0'),
    );
  } else {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: 'AIzaSyCpu44DmuGaR3fUidSadteFP67E6qVcHs4',
            //  authDomain: 'YOUR_AUTH_DOMAIN',
            projectId: 'eshop-2dec0',
            storageBucket: "eshop-2dec0.appspot.com",
            messagingSenderId: '103205150055',
            appId: '1:103205150055:android:ec0581cb1b4fc33a8123c2'));
  }

  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ProductBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WorkSansSemiBold',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
     home: SplashScreen(),
    // home: CheckOutProgressCircle(color: Colors.amber,),
    );
  }
}

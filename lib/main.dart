import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/services/htttp_util.dart';
import 'package:shop_app/common/utils/app_styles.dart';
import 'package:shop_app/global.dart';
import 'package:shop_app/pages/welcome/view/Welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

Future<void> main() async {


  //waits for the global class to be initialted before runing the app
  await Global.init();
  HttpUtil().post("api/login", queryParameters: {
    'password' : "thisispassword",
    'name' : "dara",
    'email' : "adewoledara@gmail.com",
    'open_id' : "alive",
    'avatar' : "dara",
    'type' : "1"
  });
  runApp(const ProviderScope(child: MyApp()));
}


final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: AppTheme.appThemeData,
          initialRoute: "/",
          onGenerateRoute:AppPages.generateRouteSettings ,
        );
      },
      child: Welcome(),
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 1;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Riverpod App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SecondPage()));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_alt),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: () {
              ref.read(appCount.notifier).state++;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

import 'package:artist_ums/core/app_router.dart';
import 'package:artist_ums/core/constants/key_constants.dart';
import 'package:artist_ums/core/constants/size_constants.dart';
import 'package:artist_ums/core/di/bloc_provider_config.dart';
import 'package:artist_ums/core/di/get_it_config/get_it.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/presentation/connectivity_widget.dart';
import 'package:artist_ums/core/presentation/widgets/generic_app_background.dart';
import 'package:artist_ums/core/service/deep_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jrqakggremldblmjauqw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpycWFrZ2dyZW1sZGJsbWphdXF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI1NDYwOTQsImV4cCI6MjA4ODEyMjA5NH0.OSpNrCXLUP6NEtX3AHJgfKobubF3wZd4CULxuB6R6KA',
  );
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final router = getIt<AppRouter>().createRouter();
  late final DeepLinkService deepLinkService;
  @override
  void initState() {
    deepLinkService = getIt<DeepLinkService>();
    deepLinkService.init((uri) {
      if (uri.host == 'login') {
        router.go('/login');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    deepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderConfig(
      child: MediaQuery(
        data: MediaQueryData.fromView(View.of(context)).copyWith(
          textScaler: const TextScaler.linear(
            1.0,
          ).clamp(minScaleFactor: 1.0, maxScaleFactor: 2.0),
        ),
        child: ScreenUtilInit(
          designSize: SizeConstants.screenSize,
          minTextAdapt: true,
          splitScreenMode: true,
          ensureScreenSize: true,
          fontSizeResolver: (fontSize, instance) {
            final screenSize = MediaQuery.of(context).size;
            final widthRatio =
                screenSize.width / SizeConstants.screenSize.width;
            final heightRatio =
                screenSize.height / SizeConstants.screenSize.height;
            final baseAspectRatio =
                SizeConstants.screenSize.width /
                SizeConstants.screenSize.height;
            final actualAspectRatio = screenSize.width / screenSize.height;
            final aspectRatioDifference = (actualAspectRatio / baseAspectRatio);
            final combinedRatio = (widthRatio + heightRatio) / 2;
            final adjustedScaleFactor = (combinedRatio * aspectRatioDifference)
                .clamp(1.0, 2.0);
            return fontSize * adjustedScaleFactor;
          },
          child: MaterialApp.router(
            routerConfig: router,
            scaffoldMessengerKey: getIt<KeyConstants>().scaffoldMessengerKey,
            title: 'Artist Management System',
            debugShowCheckedModeBanner: false,
            builder: (context, child) =>
                ConnectivityWidget(child: AppBackground(child: child!)),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:artist_ums/core/app_router.dart';
import 'package:artist_ums/core/constants/key_constants.dart';
import 'package:artist_ums/core/constants/size_constants.dart';
import 'package:artist_ums/core/constants/theme_constants.dart';
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
            builder: (context, child) => Theme(
              data: themeData(context),
              child: ConnectivityWidget(child: AppBackground(child: child!)),
            ),
          ),
        ),
      ),
    );
  }
}

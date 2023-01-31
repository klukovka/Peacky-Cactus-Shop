import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'config/di/injection_container.dart';
import 'config/router/app_auto_router.gr.dart';
import 'config/router/paecky_cactus_shop_observer.dart';

class PeackyCactusShopApp extends StatelessWidget {
  const PeackyCactusShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final appRouter = locator<AppAutoRouter>();

        return MaterialApp.router(
          theme: FlexThemeData.light(
            scheme: FlexScheme.jungle,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 20,
            appBarOpacity: 0.95,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              blendOnColors: false,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.nunito().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.jungle,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            blendLevel: 15,
            appBarStyle: FlexAppBarStyle.background,
            appBarOpacity: 0.90,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 30,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            fontFamily: GoogleFonts.nunito().fontFamily,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
          ],
          themeMode: ThemeMode.system,
          routeInformationParser: appRouter.defaultRouteParser(),
          routeInformationProvider: appRouter.routeInfoProvider(),
          routerDelegate: appRouter.delegate(
            navigatorObservers: () => [
              PeackyCactusShopObserver(),
            ],
          ),
        );
      },
    );
  }
}

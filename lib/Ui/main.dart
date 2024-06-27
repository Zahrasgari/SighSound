import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:untitled/Ui/home_screen.dart';
import 'package:untitled/Ui/profile_screen.dart';
import 'package:untitled/Ui/search_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/Ui/splash_screen.dart';
import 'package:untitled/provider/favorite_provider.dart';
import 'package:untitled/provider/provider.dart';
import '../provider/localization_provider.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _pageController = PageController();

  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LocalizationProvider()..init()),
      ChangeNotifierProvider(create: (BuildContext context) =>
      UiProvider()
        ..init(),),
      ChangeNotifierProvider(create: (context) => FavoriteProvider())
    ],
    child: Consumer2<UiProvider,LocalizationProvider>(
        builder: (context, UiProvider notifier,localizationProvider,child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: localizationProvider.locale,
        themeMode: notifier.isDark? ThemeMode.dark: ThemeMode.light,
        darkTheme: notifier.isDark? notifier.darkTheme: notifier.lightTheme,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    }
    ));
  }
}

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Scaffold(
            body: PageView(
              controller: _pageController,
              children:  const <Widget>[
                HomeScreen(),
                SearchPage(),
                Setting(),
              ],
            ),
            extendBody: true,
            bottomNavigationBar: RollingBottomBar(
              color: const Color(0xff4AACAB),
              controller: _pageController,
              flat: true,
              useActiveColorByDefault: false,
              itemColor: const Color(0xdae8e8e8),
              items: [
                RollingBottomBarItem(Icons.home,
                  label: AppLocalizations.of(context)?.home, activeColor: const Color(0xdae8e8e8),),
                RollingBottomBarItem(Icons.search,
                    label: AppLocalizations.of(context)?.search, activeColor:const  Color(0xdae8e8e8)),
                RollingBottomBarItem(Icons.person_outline_sharp,
                    label: AppLocalizations.of(context)?.setting, activeColor:const  Color(0xdae8e8e8)),
              ],
              enableIconRotation: true,
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
          ]),
    );
  }
}
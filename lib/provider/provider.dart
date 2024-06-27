

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Source/video_data.dart';

class UiProvider extends ChangeNotifier{

  bool _isDark= true;
  bool get isDark => _isDark;

  changeTheme(){
    _isDark =! _isDark;
    storage.setBool('isDark', _isDark);
    notifyListeners();
  }

  late SharedPreferences storage;
  final darkTheme= ThemeData(
      colorScheme:  const ColorScheme(
          primary: Color(0xff0F121B),
          onPrimary: Color(0xffFFFFFF),
          secondary: Color(0xff4AACAB),
          onSecondary: Color(0x78ffffff),
          background:Color(0xff20232f),
          onBackground: Color(0xff0F121B),
          surface: Color(0xff0F121B),
          onSurface: Color(0xff0F121B),
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0F121B),
          foregroundColor:Color(0xffffffff),

      ),


  );
  final lightTheme= ThemeData(
  colorScheme: const ColorScheme(
      primary: Color(0xffF2F4F8),
      onPrimary: Color(0xff12141B),
      secondary: Color(0xff4AACAB),
      onSecondary: Color(0xf75C6068),
      background:Color(0xffbabec7),
      onBackground: Color(0xffF2F4F8),
      surface: Color(0xffF2F4F8),
      onSurface: Color(0xffF2F4F8),
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.white),
      appBarTheme: const AppBarTheme(
      backgroundColor:Color(0xffF2F4F8),
      foregroundColor:Color(0xff12141B),
      ),


  );

  init() async{
    storage = await  SharedPreferences.getInstance();
    _isDark=storage.getBool("isDark")??false;
    notifyListeners();
  }
}



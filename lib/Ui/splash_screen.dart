import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/Ui/main.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
final _pageController = PageController();

void dispose() {
  _pageController.dispose();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigator(pageController: _pageController))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff4AACAB),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Center(

                  child: DropShadowImage(
                      blurRadius: 4,
                      offset : Offset(0.0, 4.0),
                      image: Image.asset('assets/img/lightLogo.png',width: 190,height: 190,))),
              Positioned(
                  bottom: 30,
                  child: Text(AppLocalizations.of(context)!.version,style: TextStyle(color: Colors.white),))
            ],
          )
      ),
    );
  }
}

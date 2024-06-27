import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController =
  TextEditingController(text: "test@gmail.com");
  final TextEditingController passwordController =
  TextEditingController(text: "123456");
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.red),
        primaryColor: Colors.black54,
        errorColor: Colors.black54,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xff4AACAB),
        body:  

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child:
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropShadowImage(
                        blurRadius: 4,
                        offset: const Offset(0.0, 4.0),
                        image: Image.asset(
                          'assets/img/lightLogo.png',
                          width: 100,
                          height: 130,
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(AppLocalizations.of(context)!.welcome,
                        style: const TextStyle(color: Colors.white, fontSize: 22)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                     AppLocalizations.of(context)!.signinToAcc,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.email_outlined,size: 20),
                        // prefixIconColor: Colors.white,
                        label: Text(AppLocalizations.of(context)!.mail),
                        labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w100),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(width: 1, color: Colors.red)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(width: 1, color: Colors.red)),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _PasswordTextFieldState(
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: ()  {
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        minimumSize: MaterialStateProperty.all(const Size.fromHeight(52)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                      ),
                      child: CircularProgressIndicator( color: Color(0xff4AACAB),) 
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                           AppLocalizations.of(context)!.dontHaveAcc,
                            style: TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                                AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            
          
          ),
        
      ),
    );
  }
}

class _PasswordTextFieldState extends StatefulWidget {
  const _PasswordTextFieldState({
    super.key,
    required this.controller,

  });
  final TextEditingController controller;


  @override
  State<_PasswordTextFieldState> createState() =>
      _PasswordTextFieldStateState();
}

class _PasswordTextFieldStateState extends State<_PasswordTextFieldState> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.visiblePassword,
      obscureText: obsecureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
            icon: Icon(
              obsecureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 20,
              color: Colors.white.withOpacity(0.6),
            )),
        label: Text(AppLocalizations.of(context)!.pass),
        labelStyle:  const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              width: 1,
            )),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
      ),
    );
  }
}

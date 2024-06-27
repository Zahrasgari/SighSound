import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Ui/favorite_screen.dart';
import 'package:untitled/provider/provider.dart';
import 'language_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final selectedcolor = Theme.of(context).colorScheme;
    Language lan = Language.fa;

    void updateSelectedLanguage(Language language) {
      setState(() {
        lan = language;
      });
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          AppLocalizations.of(context)!.setting,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body:
      
                Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(children: [
                              const SizedBox(width: 20,),
                              Text(AppLocalizations.of(context)!.account,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                      Theme
                                          .of(context)
                                          .appBarTheme
                                          .foregroundColor,
                                      fontWeight: FontWeight.w300)),
                            ]),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                  Theme
                                      .of(context)
                                      .colorScheme
                                      .onPrimary,
                                  radius: 30,
                                  child: Image.asset('assets/img/pfp.svg.png'),
                                ),
                                const SizedBox(width: 25,),
                                Text(AppLocalizations.of(context)!.guestuser,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor,fontSize: 14),),
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                           showDialog(context: context, builder: (context){

                                             return AlertDialog(
                                             backgroundColor: selectedcolor.background,

                                               title: Text(AppLocalizations.of(context)!.exit,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                               content: Text(AppLocalizations.of(context)!.wannalogout,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                               actions: [
                                                 TextButton(onPressed: (){Navigator.pop(context);}, child: Text(AppLocalizations.of(context)!.yes,style: const TextStyle(color: Colors.cyan),)),
                                                 TextButton(onPressed: (){ Navigator.pop(context);}, child: Text(AppLocalizations.of(context)!.no,style: const TextStyle(color: Colors.cyan))),
                                               ],
                                             );
                                           });

                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all(const Color(0xff42bebd)),
                                        foregroundColor: MaterialStateProperty
                                            .all(Colors.white),
                                        shadowColor: MaterialStateProperty.all(
                                            const Color(0x00BCD400))

                                    ),
                                    child: Text(AppLocalizations.of(context)!.exit, style: const TextStyle(fontSize: 16)))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              leading: const Icon(CupertinoIcons.heart,color: Color(0xff4AACAB),),
                              title: Text(AppLocalizations.of(context)!.favorites,style: TextStyle(fontSize: 18,color: Theme.of(context).appBarTheme.foregroundColor)),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavoriteScreen()));
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Divider(color: Color(0xb3949ba1),),
                        const SizedBox(height: 10,),
                        Row(children: [
                          const SizedBox(width: 20,),
                          Text(AppLocalizations.of(context)!.setting,
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                  Theme
                                      .of(context)
                                      .appBarTheme
                                      .foregroundColor,
                                  fontWeight: FontWeight.w300)),
                        ]),
                        ListTile(
                          leading: Icon(
                            Icons.dark_mode_outlined,
                            color: Theme
                                .of(context)
                                .appBarTheme
                                .foregroundColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.darkmode,
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .appBarTheme
                                    .foregroundColor),
                          ),
                          trailing: Switch(
                            value: notifier.isDark,
                            onChanged: (value) => notifier.changeTheme(),
                            activeColor: selectedcolor.secondary,
                            inactiveThumbColor: const Color(0xf7ffffff),
                            inactiveTrackColor: const Color(0xa358b4b4),
                            trackOutlineColor: MaterialStateProperty.all(Colors
                                .cyan),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Theme
                                .of(context)
                                .appBarTheme
                                .foregroundColor,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.language,
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .appBarTheme
                                    .foregroundColor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const LanguageScreen();
                                }));
                              },
                              icon: Icon(Icons.navigate_next,
                                color: Theme.of(context).appBarTheme.foregroundColor,)),
                        ),


                      ],
                    ),
                  );
                })
            
          
    );
  }
}

enum Language { en, fa }

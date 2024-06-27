import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Ui/category_screen.dart';
import 'package:untitled/Ui/profile_screen.dart';
import 'package:untitled/Ui/video_player_screen.dart';
import '../Source/video_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<VideoDataModel> firstList = VideoData.sublist(0, 5);
  final List<VideoDataModel> secondList = VideoData.sublist(5, 10);
  final List<VideoDataModel> thirdList = VideoData.sublist(10, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,

          leading:  Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 0),
            child: ImageIcon(
              const AssetImage('assets/img/lightLogo.png'),
              size: 15,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
            child: Text(
              AppLocalizations.of(context)!.homeTitle,
              style: TextStyle(
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 0, right: 8, top: 12, bottom: 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Setting();
                    }));
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    size: 26,
                  )),
            ),
          ],
          backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: 
           SingleChildScrollView(
              child: Padding(
                padding:  const EdgeInsets.fromLTRB(16, 16, 16, 70),
                child: Column(
                  children: [
                    VideoCategory(videoList: firstList,),
                    const SizedBox(
                      height: 10,
                    ),
                    VideoCategory(videoList: secondList,),
                    const SizedBox(
                      height: 10,
                    ),
                    VideoCategory(videoList: thirdList,),
                  ],
                ),
              ),
            )
    );
  }
}

class VideoCategory extends StatefulWidget {
  final List<VideoDataModel> videoList;
  const VideoCategory({
    super.key, required this.videoList,
  });

  @override
  State<VideoCategory> createState() => _VideoCategoryState();
}

class _VideoCategoryState extends State<VideoCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.category,
                  style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryItems(videoList: widget.videoList,)));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.more,
                      style: const TextStyle(color: Color(0xff4AACAB), shadows: [
                        Shadow(
                          blurRadius: 0.4,
                          offset: Offset(0, 0),
                          color: Color(0xff4aacab),
                        )
                      ]),
                    ))
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.videoList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 228,
                        height: 233,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => (VideoPlayerView(videoDataModel:widget.videoList[index]))));
                              },
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      widget.videoList[index].thumb,
                                    )),
                                 const Padding(
                                  padding: EdgeInsets.only(left: 18, top: 15),
                                  child: Text(
                                    "22:10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )
                              ]),
                            ),
                            Row(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.videoList[index].title,
                                  style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        backgroundColor: Theme.of(context).colorScheme.background,
                                        title: Text(AppLocalizations.of(context)!.error,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                        content:  Text(AppLocalizations.of(context)!.favoriteerror,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                        actions: [
                                          TextButton(onPressed: (){Navigator.pop(context);}, child: Text(AppLocalizations.of(context)!.ok,style: const TextStyle(color: Colors.cyan,fontSize: 18)))
                                        ],
                                      );
                                    });

                                  },
                                  icon: 
                                  const Icon(CupertinoIcons.heart),
                                  color: const Color(0xff4AACAB),


                                ),
                              ],
                            ),
                            Text(
                              widget.videoList[index].subtitle,
                              style: const TextStyle(
                                  color: Color(0x789D9D9D), fontSize: 9),
                            )
                          ],
                        ),
                      ),
                    ),
              ),
            )
          ],
        );
    
  }
}


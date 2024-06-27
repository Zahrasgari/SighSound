import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Source/video_data.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.videoDataModel,
  });

  final VideoDataModel videoDataModel;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController vidCtrl;
  late ChewieController chewieCtrl;



  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    vidCtrl =
        VideoPlayerController.asset("assets/Video_url/GoodBye.mp4");
      //  VideoPlayerController.networkUrl(Uri.parse(widget.videoDataModel.url));
    await vidCtrl.initialize();
    chewieCtrl = ChewieController(
      videoPlayerController: vidCtrl,
      autoPlay: false,
      allowFullScreen: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: const Color(0xff4AACAB),
        bufferedColor: const Color(0xffafafaf),
        handleColor: const Color(0xff3cd5d3),
      ),
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    vidCtrl.dispose();
    chewieCtrl.dispose();
  }

  shareUrl() async{
    final result = await Share.shareWithResult(widget.videoDataModel.url);
  }

  final _flutterDownload = MediaDownload();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          iconTheme: IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            widget.videoDataModel.title,
            style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor, fontSize: 18),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: 
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    width: 340,
                    height: 214,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0x76303857),
                    ),

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: vidCtrl.value.isInitialized
                            ? Chewie(controller: chewieCtrl)
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textDirection: TextDirection.rtl,
                        widget.videoDataModel.title,
                        style: const TextStyle(
                            color: Color(0xff4AACAB),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.videoDataModel.description,
                            style: TextStyle(color:Theme.of(context).appBarTheme.foregroundColor, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //share
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff4AACAB),
                            shape: const CircleBorder(),
                          ),
                          onPressed : (){
                            shareUrl();
                          },
                          child: const Icon(
                            CupertinoIcons.share,
                            color: Colors.white,
                          ),
                        ),
                        //like
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:  const Color(0xff4AACAB),
                            shape: const CircleBorder(),
                          ),
                          onPressed: () async{
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title: Text(AppLocalizations.of(context)!.error,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                              content:  Text(AppLocalizations.of(context)!.favoriteerror,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                              actions: [
                                TextButton(onPressed: (){Navigator.pop(context);}, child: Text( AppLocalizations.of(context)!.ok,style: const TextStyle(color: Colors.cyan,fontSize: 18)))
                              ],
                            );
                          });},
                          child:const Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                        //download
                        ElevatedButton(
                            onPressed: () {

                              showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Theme.of(context).colorScheme.background,
                                  title: Text(AppLocalizations.of(context)!.error,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                  content: Text(AppLocalizations.of(context)!.downloaderror,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                                  actions: [
                                    TextButton(onPressed: (){Navigator.pop(context);}, child:Text(AppLocalizations.of(context)!.ok,style: TextStyle(color: Colors.cyan,fontSize: 18)))
                                  ],
                                  );
                                }
                              );
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff4AACAB)),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.down_arrow,
                                  color: Colors.white,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.download,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xb3949ba1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.youmightlike,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child:
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:VideoData.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 103,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xb3949ba1),
                                              width: 0.5
                                          )
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16,left: 5),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(builder: (context) => (VideoPlayerView(videoDataModel: VideoData[index]))));
                                          },
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Image.asset(
                                                VideoData[index].thumb,
                                              )),
                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(VideoData[index].title,style: const TextStyle(color: Color(0xff4AACAB),fontWeight: FontWeight.w700),),
                                          SizedBox(
                                            width: 120,
                                            height: 31,
                                            child: Text(VideoData[index].description,overflow: TextOverflow.clip,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor,fontSize: 10,),),
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(VideoData[index].subtitle,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor,fontSize: 8),),
                                              const SizedBox(width: 15,),
                                              Text(AppLocalizations.of(context)!.duration,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor,fontSize: 8),)
                                            ],
                                          )
                                        ],
                                      ),




                                    ],
                                  ),

                                ),
                              )
                              )


                    ),
                  ),
                ],
              ),
            )
  
      ),
    );

  }
}




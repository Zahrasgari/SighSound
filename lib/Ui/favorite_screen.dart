import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/Ui/video_player_screen.dart';
import 'package:untitled/provider/favorite_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  shareUrl() async{
    final result = await Share.shareWithResult( "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    );
  }
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favVideos = provider.FavoriteVidList;
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.favorites),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){Provider.of<FavoriteProvider>(context,listen: false).removeAll();
        }, label: Icon(CupertinoIcons.delete,color: Theme.of(context).colorScheme.background,),
        backgroundColor:  const Color(0xff4AACAB),),
        
        body: favVideos.isEmpty?
                Center(
              child: Text(
                AppLocalizations.of(context)!.novideoyet,
                style: const TextStyle(fontSize: 20,color: Colors.cyan),
              ),
            ): Padding (
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder (
                itemCount: favVideos.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 103,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xb3949ba1), width: 0.5))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16, left: 5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (VideoPlayerView(
                                      videoDataModel: favVideos[index]))));
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(favVideos[index].thumb,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favVideos[index].title,
                                  style: const TextStyle(
                                      color: Color(0xff4AACAB),
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 120,
                                  height: 31,
                                  child: Text(
                                    favVideos[index].description,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: Theme.of(context).appBarTheme.foregroundColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      favVideos[index].subtitle,
                                      style: TextStyle(
                                          color: Theme.of(context).appBarTheme.foregroundColor,
                                          fontSize: 8),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.duration,
                                      style: TextStyle(
                                          color: Theme.of(context).appBarTheme.foregroundColor,
                                          fontSize: 8),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () async{
                                    shareUrl();
                                  },
                                  icon:
                                  const Icon(Icons.share,
                                      color: Color(0xff4AACAB),
                                ),
                              ),
                            ),
                            )],
                        ),
                      )); // your existing itemBuilder code}
                }
            )),
        );
  }
}


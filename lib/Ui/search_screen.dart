import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/Ui/video_player_screen.dart';
import '../Source/video_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<VideoDataModel> filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredItems = VideoData;
    super.initState();
  }

  void _runFilter(String enteredKeyBoard) {
    List<VideoDataModel> results = [];
    if (enteredKeyBoard.isEmpty) {
      results = VideoData;
    } else {
      results = VideoData.where((element) => element.title
          .toLowerCase()
          .contains(enteredKeyBoard.toLowerCase())).toList();
    }
    setState(() {
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          AppLocalizations.of(context)!.search,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
        ),
      ),
      body:   Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffCECECE),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: const Color(0xff4AACAB),
                        hintText: AppLocalizations.of(context)!.hintSearchAll,
                        border: InputBorder.none,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 103,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xb3dae3ea), width: 0.5))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16, left: 5),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    (VideoPlayerView(
                                                        videoDataModel: filteredItems[index]
                                                    ))));
                                        },
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.asset(
                                            filteredItems[index].thumb,
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
                                        filteredItems[index].title,
                                        style: const TextStyle(
                                            color: Color(0xff4AACAB),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        height: 31,
                                        child: Text(
                                          filteredItems[index].description,
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
                                            filteredItems[index].subtitle,
                                            style: TextStyle(
                                                color:Theme.of(context).appBarTheme.foregroundColor, fontSize: 8),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.duration,
                                            style:  TextStyle(
                                                color: Theme.of(context).appBarTheme.foregroundColor, fontSize: 8),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                )
              ],
            ),
          )
      
    );
  }
}

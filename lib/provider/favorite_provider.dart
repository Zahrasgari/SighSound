
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Source/video_data.dart';

class FavoriteProvider extends ChangeNotifier{

  List<VideoDataModel> _FavoriteVidList = [];
  List<VideoDataModel> get FavoriteVidList => _FavoriteVidList;


  void toggleFavorite(VideoDataModel video){
    final isExist = _FavoriteVidList.contains(video);
    if(isExist){
      _FavoriteVidList.remove(video);
    }else{
      FavoriteVidList.add(video);
    }
    notifyListeners();
  }

  void removeAll(){
    _FavoriteVidList=[];
    notifyListeners();
  }
  bool isExist(VideoDataModel video) {
    final isExist = _FavoriteVidList.contains(video);
    return isExist;
  }


  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }


}
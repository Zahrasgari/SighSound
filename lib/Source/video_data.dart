class VideoDataModel {
  final String title, thumb, subtitle, url, description;

  VideoDataModel(
      {required this.title,
      required this.thumb,
      required this.subtitle,
      required this.url,
      required this.description});
}

final List<VideoDataModel> VideoData = List.generate(
    videoTitle.length,
    (index) => VideoDataModel(
        title: '${videoTitle[index]}',
        thumb: '${videoThumb[index]}',
        subtitle: '${videoSubtitle[index]}',
        url: '${videoUrl[index]}',
        description: '${videoDescription[index]}'));

List videoTitle = [
  "Will See",
  "Well Done",
  "Verbs",
  "Understand",
  "Thank You",
  "Take Care",
  "Slow",
  "See You Later",
  "Nice to See You",
  "Nice to Meet You",
  "Morning",
  "Learn VS Teach",
  "How are You",
  "Good",
  "Again"
];

List videoThumb = [
  "assets/video_img/willsee.jpg",
  "assets/video_img/welldone.jpg",
  "assets/video_img/verbs.jpg",
  "assets/video_img/understand.jpg",
  "assets/video_img/thankyou.jpg",
  "assets/video_img/takecare.jpg",
  "assets/video_img/slow.jpg",
  "assets/video_img/seeyoulater.jpg",
  "assets/video_img/nicetoseeyou.jpg",
  "assets/video_img/nicetomeetyou.jpg",
  "assets/video_img/morning.jpg",
  "assets/video_img/learnteach.jpg",
  "assets/video_img/howareyou.jpg",
  "assets/video_img/good.jpg",
  "assets/video_img/again.jpg"
];

List videoSubtitle = [
  "By Google",
  "By Hames",
  "By Sara",
  "By Rooyan",
  "By Anabella",
  "By Kara",
  "By Eren",
  "By Levi",
  "By Izabella",
  "By ANtony",
  "By zebragh",
  "By chemical",
  "By lorenGrey",
  "By Selena",
  "By Sofia"
];

List videoUrl = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
];

List videoDescription = [
  "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For 35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For 35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For 35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For 35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
  "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org",  "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For 35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For 35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For 35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For 35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
  "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org",  "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For 35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For 35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For 35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.",
  "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster's big meltdowns even bigger. For 35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.",
  "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org",
];

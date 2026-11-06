abstract class Api_consumer{


Future get(url , {data,Map<String,dynamic> query});
Future post(url , {data,Map<String,dynamic> query});
Future patch(url , {data,Map<String,dynamic> query});
Future delete(url , {data,Map<String,dynamic> query});


}
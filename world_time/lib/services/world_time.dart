import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //location name for the ui
  late String time; //time in the location

  late String flag; //url time flag
  late String url; //location url for api endpoint


  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      //make request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get propreties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //print(dateTime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set time property
      time = DateFormat.jm().format(now);
    } catch (e){
      print('error: $e');
      time = 'could not get time data';
    }
  }

}
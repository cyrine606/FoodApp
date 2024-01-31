//we're going to provide that request , we are going to leave back that string
//which is the encoded polyline and then it's going to be converted to points
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey = "AIzaSyA_RTemfzdsmUwZAD1pjUkjEmT5__5Yctk";
class GoogleMapsServices {
Future<String> getRouteCoordinates(LatLng l1,LatLng l2) async{
String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
http.Response response = await http.get(url);//we will convert the json that we will get as a response and convert that to our map
Map values = jsonDecode(response.body);
return values["route"][0]["overview_polyline"]["points"];
}
}
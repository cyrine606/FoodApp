/*import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563,-122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(45.531563,-122.677433),
    tilt: 59.440,
    zoom: 11.0,
  );
  Future<void> _goToPosition1() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }
  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }
  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }
  //widget to add a button to the map
  Widget button (Function function,IconData icon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(icon,size: 36.0,),
    );
  }
  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal?MapType.satellite:MapType.normal;
    });
  }
  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a title',
            snippet: 'This is a snipper',
          ),
          icon: BitmapDescriptor.defaultMarker,
        )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Map',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
        ),
        body: Container (
    height: 400,
      width: 400,
      child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            //creating the three buttons
            Padding(
                padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    button(_onMapTypeButtonPressed,Icons.map),
                    SizedBox(height: 16.0,),
                    button(_onAddMarkerButtonPressed,Icons.add_location),
                    SizedBox(height: 16.0,),
                    button(_goToPosition1,Icons.location_searching),
                  ],
                ),
              ),
            ),
          ],
        ),),
      )
    );
  }
}*/
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../requests/google_maps_request.dart';//
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:geolocator/geolocator.dart';
class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Map(),
    );
  }
}
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  String location;
  GoogleMapController mapController;
  GoogleMapsServices _googleMapServices;//
  TextEditingController locationController = TextEditingController(); // which will take the user location
  TextEditingController destinationController = TextEditingController(); // which will take the destination
  //static LatLng _initialPosition = LatLng(35.82556,10.64111);
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};//these are the lines that will be drawn to show the road

  @override //
  void initState(){
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return _initialPosition == null? Container(
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ) : Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                bearing: 192.833,
                target: _initialPosition,
                tilt: 59.440,
                zoom: 12.0,
              ),
              onMapCreated: onCreated,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              markers: _markers,
              onCameraMove: _onCameraMove,
              polylines: _polyLines,//this will display polylines on the map
            ),
          ),
          Positioned(
            top: 40.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0,5.0),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller:locationController,
                decoration: InputDecoration(
                  icon: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.only(left: 20,bottom: 8.0),
                    child: Icon(Icons.location_on,color: Colors.blue.shade900,),
                  ),
                  hintText: "Pick up",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0,top: 8.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0,5.0),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: destinationController,
                textInputAction: TextInputAction.go, //shows what the main action of your keyboard
                onSubmitted: (value){
                  sendRequest(value);
                },
                decoration: InputDecoration(
                  icon: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.only(left: 20,bottom: 8.0),
                    child: Icon(Icons.local_taxi,color: Colors.blue.shade900,),
                  ),
                  hintText: "destination",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0,top: 8.0),
                ),
              ),
            ),
          ),
          /*Positioned(
            top: 40,
            right: 10,
            child: FloatingActionButton(
              onPressed: _onAddMarkerPressed,
              tooltip: "Add Marker",
              backgroundColor: Colors.black,
              child: Icon(Icons.add_location,color: Colors.white,),
            ),
          )*/
        ],),
    );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }

  void _addMarker(LatLng location, String adress) {
    setState(() {
      _markers.add(Marker(
        //markerId: MarkerId(_lastPosition.toString()),
        markerId: MarkerId(adress),
        position: location,
        infoWindow: InfoWindow(
            title: adress,
            snippet: "go here"
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
      );
    });
  }

  /*
  *decodePoly returns => [41.222,12.333,8.554,9.5466]
  * converToLatLng returns => [(41.222,12.333),(8.554,9.5466)]
  * */
  //this method will convert list of doubles(points) into LatLng
  List<LatLng> convertToLatLng(List points){
    List<LatLng> result = <LatLng>[];
    for(int i = 0;i < points.length;i++){
      if(i % 2 != 0){
        result.add(LatLng(points[i-1],points[i]));
      }
    }
    return result;
  }

//this method will convert that string polyline to list of points (point:longitude,lattitude)
  List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      }
      while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    for (var i = 2; i < lList.length; i++)
      lList[i] += lList[i - 2];
    print(lList.toString());
    return lList;
  }

  void _getUserLocation() async { //method the get user location
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationController.text = placemark[0].name;
      this.location = locationController.text;//convert the location into an adress
    });
    _addMarker(_initialPosition, location);
  }
  void createRoute(String encodedPoly){//draw line route on the map
    setState(() {
      _polyLines.add(Polyline(polylineId: PolylineId(_lastPosition.toString()),
      color: Colors.black,
        width: 10,
        points: convertToLatLng(decodePoly(encodedPoly)),
      ),);
    });
  }

  //this function will get executed when the user tapes something in the the textFormField
  void sendRequest (String intendedDestination) async{
    List<Placemark> placemark = await Geolocator().placemarkFromAddress(intendedDestination); //that will convert an adress which is the destination to coordinates
    double latitude = placemark[0].position.latitude;
    double longitude = placemark[0].position.longitude;
    LatLng destination = LatLng(latitude,longitude);
    _addMarker(destination,intendedDestination);
    String route = await _googleMapServices.getRouteCoordinates(_initialPosition, destination);
    createRoute(route);
  }
}


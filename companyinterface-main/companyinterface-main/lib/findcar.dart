import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class FindCar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return FindCarwidget();
  }
}

//    const token = jwt.sign(
//     { user_id: userm._id, newIdnum },
//     jwtKey,
//     {
//       expiresIn: "2h",
//     }
//   );
// https://www.canva.com/design/DAFWCP0HEL8/FGMotxw40LopIdigcz0NQg/edit
 
//   user.token = token;

class FindCarwidget extends State {
  late GoogleMapController mapController;
  String srchAddr = "";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      var initialCameraPosition2 = null;
      return Scaffold(
        body: Stack(
          children: <Widget>[
            // GoogleMapsPlugin()
            // GoogleMap(
            //   onMapCreated: onMapCreated,
            //   initialCameraPosition: initialCameraPosition2,
            // ),
          ],
        ),
      );
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}

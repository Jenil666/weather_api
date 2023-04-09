import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/screen/home/modal/weather_modal.dart';
import 'package:weather_api/screen/home/provider/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  WeatherProvider? T, F;

  @override
  Widget build(BuildContext context) {
    F = Provider.of<WeatherProvider>(context, listen: false);
    T = Provider.of<WeatherProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              WeatherModal? weatherModal = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 750,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openDrawer(),
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${weatherModal!.name}",style: GoogleFonts.rajdhani(
                                      color: Colors.white, fontSize: 20),
                                  ),
                                  Container(
                                    width: 50,
                                    child: Text(
                                      "Jenil",
                                      style:
                                          GoogleFonts.babylonica(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              // Center(child: Text("${weatherModal!.weather[0].id}")),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 600,left: 30),
                            child: Row(
                              children: [
                                Text("${weatherModal.main.temp}K",style: GoogleFonts.quicksand(fontSize: 50,color: Colors.black54),),
                                Spacer(),
                                Text("${weatherModal.weather[0].main}",style: GoogleFonts.quicksand(fontSize: 20,color: Colors.black54),),
                                SizedBox(width: 30,)
                              ],
                            ),
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.orange.shade400,
                            Colors.yellowAccent.shade100,
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.white,
                      child:Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 72,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thermostat,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.main.tempMin}K",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.close_fullscreen,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.main.pressure} hPa",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.water_drop,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.main.humidity}%",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.visibility_outlined,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.visibility}m",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.wind_power_outlined,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.wind.speed}Km/h",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.directions,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.wind.deg}",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.clouds.all}",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 70,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timelapse,color: Colors.orange,size: 30,),
                                    Text("${weatherModal.timezone}",style: TextStyle(color: Colors.orange),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          future: F!.jsonParcing(lat: T!.lat, lon: T!.lon),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          width: 230,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Select City",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: T!.nameOfCity.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        T!.currentIndex = index;
                        F!.updateParameters(index);
                        F!.refresh();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "${T!.nameOfCity[index]}",
                          style: GoogleFonts.rajdhani(
                              color: Colors.white, fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                            color: T!.currentIndex == index
                                ? Colors.redAccent.shade200
                                : Colors.pinkAccent.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: T!.currentIndex == index
                                    ? Colors.red
                                    : Colors.pink,
                                width: 2)),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    F!.changeParamater(T!.userLat, T!.usweLon);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

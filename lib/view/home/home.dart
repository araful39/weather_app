import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weater_app/controller/home_controller.dart';
import 'package:weater_app/view/home/widget/day_button.dart';
import 'package:weater_app/view/home/widget/sunset_time_card.dart';
import 'package:weater_app/view/home/widget/temp_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
  var  service=   homeController.weatherData.value;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF97ABFF),
                  Color(0xFF121397),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    service.name ?? "Location",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        "Current Location",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/cloudy.png"),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "13",
                            style:
                                TextStyle(color: Colors.white, fontSize: 100),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Partly Cloud -",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "H:10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white,
                                size: 5,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "L:4",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white,
                                size: 5,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DayButton(
                        onTap: () {},
                        name: 'To Day',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DayButton(
                        onTap: () {},
                        name: 'Next Days',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const TemperatureCard(
                              time: 'Now',
                              imageUrl: 'assets/cloudy.png',
                              temp: '15',
                            );
                          }),
                    ),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/subtract.png",
                    height: Get.height * 0.35,
                    width: Get.width,
                  ),
                  Positioned(
                    top: -8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset("assets/ellipse.png"),
                            Positioned(
                                bottom: 1,
                                right: 20,
                                child: Image.asset("assets/vector.png")),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      SunsetTimeCard(
                        imageUrl: 'assets/sun-fog.png',
                        sunsetTime: '',
                        sunriseTime: '',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SunsetTimeCard(
                        imageUrl: 'assets/sun.png',
                        sunsetTime: '',
                        sunriseTime: '',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

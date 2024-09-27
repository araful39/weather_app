import 'package:flutter/material.dart';
import 'package:weater_app/view/home/widget/day_button.dart';
import 'package:weater_app/view/home/widget/temp_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Dhaka",
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
                        style: TextStyle(color: Colors.white, fontSize: 100),
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
                     itemBuilder: (context,index){
                   return   const TemperatureCard(time: 'Now', imageUrl: 'assets/cloudy.png', temp: '15',);
                 }),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}



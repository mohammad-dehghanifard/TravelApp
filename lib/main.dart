import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/model/TravelModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double imageSize = 60;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // top page
          SizedBox(
            width: double.infinity,
            height: size.height / 1.7,
            child: Stack(
              children: [
                //header image
                Container(
                  width: double.infinity,
                  height: size.height / 2.1,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(55),
                          bottomRight: Radius.circular(55)),
                      image: DecorationImage(
                          image: AssetImage(travelList[_selectedIndex].image),
                          fit: BoxFit.cover)),
                ),
                //icons
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //arrow left icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(150, 255, 255, 255),
                                shape: BoxShape.circle),
                            child: const Icon(CupertinoIcons.arrow_left),
                          ),
                          // heart icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(150, 255, 255, 255),
                                shape: BoxShape.circle),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // image list
                Positioned(
                  right: 15,
                  top: 70,
                  child: SizedBox(
                    width: 90,
                    height: double.maxFinite,
                    child: ListView.builder(
                      itemCount: travelList.length,
                      itemBuilder: (context, index) {
                        return ImageItem(index, imageSize);
                      },
                    ),
                  ),
                ),
                // txt name || location
                Positioned(
                  bottom: size.height / 8,
                  left: size.width / 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Text(
                        travelList[_selectedIndex].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      //location
                      Row(
                        children: [
                          const Icon(CupertinoIcons.placemark_fill,
                              color: Colors.white),
                          Text(travelList[_selectedIndex].location,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //bottom page
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                //Card Information
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // information
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromARGB(60, 0, 0, 0), width: 1),
                      ),
                      child: SizedBox(
                        width: size.width / 4,
                        height: size.width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Distance",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              travelList[_selectedIndex].distance + " km ",
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 120, 202, 222)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromARGB(60, 0, 0, 0), width: 1),
                      ),
                      child: SizedBox(
                        width: size.width / 4,
                        height: size.width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Temp",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              travelList[_selectedIndex].temp + " C ",
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 120, 202, 222)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: Color.fromARGB(60, 0, 0, 0), width: 1),
                      ),
                      child: SizedBox(
                        width: size.width / 4,
                        height: size.width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Rating",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              travelList[_selectedIndex].rating,
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 120, 202, 222)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Discription text
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Description"),
                      const SizedBox(height: 8),
                      ExpandableText(
                        travelList[_selectedIndex].discription,
                        style: const TextStyle(fontSize: 12),
                        expandText: "Read More",
                        collapseText: "collapse",
                      )
                    ],
                  ),
                ),
                // price text && bottom next
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Total Price"),
                          const SizedBox(height: 8),
                          Text(
                            travelList[_selectedIndex].price,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),

                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget ImageItem(int index, double imageSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: _selectedIndex == index ? imageSize + 15 : imageSize,
                height: _selectedIndex == index ? imageSize + 15 : imageSize,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage(travelList[index].image),
                        fit: BoxFit.fill))),
          )
        ],
      ),
    );
  }
}

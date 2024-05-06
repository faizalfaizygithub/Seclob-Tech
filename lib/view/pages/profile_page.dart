import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var jsonlist;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        setState(() {
          jsonlist = response.data['products'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appBarSec(Image.asset('assets/Group.png')),
                    appBarSec(const Icon(
                      Icons.more_horiz,
                      size: 35,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                firstSection(),
                const SizedBox(
                  height: 10,
                ),
                bioSec(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonSec('Edit profile', Colors.blueAccent),
                    const SizedBox(
                      width: 10,
                    ),
                    buttonSec('Wallet', const Color.fromARGB(255, 7, 110, 105)),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 17, 125, 179),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [TabSect('Photos'), TabSect('Videos')],
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 1.08,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: jsonlist == null ? 0 : jsonlist.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      if (jsonlist != null &&
                          jsonlist[index] != null &&
                          jsonlist[index]['thumbnail'] != null) {
                        return Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 300,
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.network(
                                  jsonlist[index]['thumbnail'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.message_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(); // Return an empty container if thumbnail data is not available
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueAccent),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              Icon(
                Icons.person_pin_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  appBarSec(Widget child) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blueGrey.shade100,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(1, 2), blurRadius: 2)
            ]),
        child: child);
  }

  firstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/pic.jpg'),
          radius: 50,
        ),
        Expanded(
          child: Column(
            children: [
              const Text('50'),
              Text(
                'Post',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('564'),
              Text(
                'Followers',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text('564'),
              Text(
                'Following',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
              )
            ],
          ),
        ),
      ],
    );
  }

  bioSec() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rayan Moon',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Photographer',
          style: TextStyle(fontSize: 10, color: Colors.black87),
        ),
        Text(
          'You are beautiful ,and ',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        Text(
          "i'm here to capture it!",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  buttonSec(String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 45,
        width: 150,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(18)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  TabSect(String txt) {
    return Text(
      txt,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }
}

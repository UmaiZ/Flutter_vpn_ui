import 'package:flutter/material.dart';

class VpnPage extends StatefulWidget {
  const VpnPage({super.key});

  @override
  State<VpnPage> createState() => _VpnPageState();
}

class _VpnPageState extends State<VpnPage> with TickerProviderStateMixin {
  late AnimationController _headanimationController;
  late AnimationController _sidesanimationController;

  late Animation<Offset> _headcontroller;
  late Animation<Offset> _leftsidecontroller;
  late Animation<Offset> _rightsidecontroller;
  late Animation<double> _headImagecontroller;
  late Animation<double> _sideImagecontroller;

  var servers = [
    {
      'country': 'Germany',
      'image': 'assets/images/0.png',
      'ip': '234.357.136.39'
    },
    {
      'country': 'England',
      'image': 'assets/images/1.png',
      'ip': '234.357.136.39'
    },
    {
      'country': 'Pakistan',
      'image': 'assets/images/2.png',
      'ip': '234.357.136.39'
    },
    {
      'country': 'India',
      'image': 'assets/images/3.png',
      'ip': '234.357.136.39'
    },
    {
      'country': 'Canada',
      'image': 'assets/images/4.png',
      'ip': '234.357.136.39'
    }
  ];

  bool connect = false;
  bool showloading = false;

  @override
  void initState() {
    super.initState();
    _headanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _sidesanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _headcontroller = Tween<Offset>(
      begin: const Offset(0, -2.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
          parent: _headanimationController, curve: Curves.easeInOut),
    );

    _leftsidecontroller = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
          parent: _sidesanimationController, curve: Curves.easeInOut),
    );
    _rightsidecontroller = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
          parent: _sidesanimationController, curve: Curves.easeInOut),
    );

    _headImagecontroller = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _headanimationController,
      curve: Curves.easeInOut,
    ));
    _sideImagecontroller = Tween<double>(
      begin: 0.1,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _headanimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _headanimationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _sidesanimationController.reset();
    _headanimationController.reset();
    _headanimationController.forward();
    _sidesanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: connect ? "Connected! " : "Exposed! ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                      TextSpan(
                          text: connect
                              ? 'Your Device is protected'
                              : 'Your Device is unprotected',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff151422),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              "VPN PROXY MASTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 300,
                          height: 235,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (showloading)
                                    Container(
                                      width: connect ? 225 : 250,
                                      height: connect ? 225 : 250,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff151422),
                                      ),
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xff39acc1)),
                                      ),
                                    ),
                                  Image.asset(
                                    'assets/images/world.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                child: SlideTransition(
                                  position: _headcontroller,
                                  child: Image.asset(
                                    'assets/images/head.png',
                                    opacity: _headImagecontroller,
                                    width: 200,
                                    height: 160,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 40,
                                top: 28,
                                child: SlideTransition(
                                  position: _rightsidecontroller,
                                  child: Image.asset(
                                    'assets/images/right.png',
                                    height: 195,
                                    opacity: _sideImagecontroller,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 40,
                                top: 28,
                                child: SlideTransition(
                                  position: _leftsidecontroller,
                                  child: Image.asset(
                                    'assets/images/left.png',
                                    height: 195,
                                    opacity: _sideImagecontroller,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!connect) {
                              Future.delayed(const Duration(milliseconds: 2000),
                                  () {
                                _startAnimation();
                                setState(() {
                                  showloading = !showloading;
                                });
                              });
                            } else {
                              Future.delayed(const Duration(milliseconds: 2000),
                                  () {
                                _sidesanimationController.reverse();
                                _headanimationController.reverse();
                                setState(() {
                                  showloading = !showloading;
                                });
                              });
                            }
                            setState(() {
                              showloading = !showloading;
                              connect = !connect;
                            });
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff20202d),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xffa2a2ae),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                connect ? "Disconnect" : "Connect",
                                style: const TextStyle(
                                    color: Color(0xffa2a2ae), fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.185,
            minChildSize: 0.185,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xff20202d),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 60,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: Color(0xff151422),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        controller: scrollController,
                        itemCount: servers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              servers[index]['image'].toString(),
                              width: 40,
                            ),
                            title: Text(
                              servers[index]['country'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              servers[index]['ip'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

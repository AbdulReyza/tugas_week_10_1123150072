import 'package:flutter/material.dart';
import 'package:tugas_week_10_1123150072/login/login.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(0, 35, 53, 1),
              automaticallyImplyLeading: false,
            ),
            body: Container(
              width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 35, 53, 1),
                Color.fromRGBO(64, 193, 199, 1)
              ],
            ),
          ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      
                      Image.asset(
                        'assets/images/io2_desktop_640x480_fb99b254-1.webp',
                        width: 300,
                        height: 300,
                      ),
              
                      SizedBox(height: 20),
                      Padding(
                        padding:  EdgeInsets.all(10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginDong(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF0077B6),
                                    Color(0xFF00B4D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(14)),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'GOOOOOO!!!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
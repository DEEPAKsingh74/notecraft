import 'package:flutter/material.dart';

class ThirdPager extends StatelessWidget {
  const ThirdPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 35, left: 10),
          width: double.infinity,
          height: 150,
          // color: Colors.amber,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Share And Collaborate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 47, 47, 47),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Easily share your work with your friends and team. Get your work done with collaborations.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 140, 140, 149),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/collab.gif',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

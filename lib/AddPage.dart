import 'package:flutter/material.dart';
import 'contants.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height,
      color: background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BoxContainers(
              heading: headings[0],
              bio: bio[0],
              image: 'assets/images/${images[0]}.png',
              completion: 0,
            ),
            BoxContainers(
              heading: headings[1],
              bio: bio[1],
              image: 'assets/images/${images[1]}.png',
              completion: 1,
            ),
            BoxContainers(
              heading: headings[2],
              bio: bio[2],
              image: 'assets/images/${images[2]}.png',
              completion: 2,
            ),
            BoxContainers(
              heading: headings[3],
              bio: bio[3],
              image: 'assets/images/${images[3]}.png',
              completion: 3,
            ),
            BoxContainers(
              heading: headings[4],
              bio: bio[4],
              image: 'assets/images/${images[4]}.png',
              completion: 4,
            )
          ],
        ),
      ),
    );
  }
}

class BoxContainers extends StatefulWidget {
  BoxContainers(
      {Key? key, this.heading, this.bio, this.image, required this.completion})
      : super(key: key);

  final image;
  final heading;
  final bio;
  int completion = 0;

  @override
  State<BoxContainers> createState() => _BoxContainersState();
}

class _BoxContainersState extends State<BoxContainers> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 120,
      decoration: BoxDecoration(
        color: todayWork[widget.completion] ? c2 : c5,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(widget.image),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.heading,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                widget.bio,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    todayWork[widget.completion] = todayWork[widget.completion] ? false : true;
                    if (todayWork[widget.completion] == true) {
                      height = height-90;
                    } else {
                      height = height+90;
                    }
                  });
                },
                child: Container(
                  height: 24,
                  width: 40,
                  decoration: BoxDecoration(
                    color: todayWork[widget.completion] ? c4 : c3,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: todayWork[widget.completion] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

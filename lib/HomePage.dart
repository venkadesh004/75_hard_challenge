import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;
import 'contants.dart';

class MyPainter extends CustomPainter {
  double percent = 0;

  MyPainter(double percent) {
    double value = (percent / 100) * 360;
    this.percent = value;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Get the center of the canvas
    final center = Offset(size.width / 2, size.height / 2);

    // Draw the gray background seen on the progress indicator
    // This will act as the background layer.
    canvas.drawCircle(
      center,
      50,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Color.fromRGBO(45, 55, 88, 1)
        ..strokeWidth = 10,
    );

    // Create a new layer where we will be painting the
    // actual progress indicator
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: 200, height: 200),
      Paint(),
    );

    // Draw the light green portion of the progress indicator
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 130, height: 130),
      vmath.radians(0),
      vmath.radians(this.percent),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Color.fromRGBO(25, 36, 68, 1)!
        ..strokeWidth = 20,
    );

    // Draw the dark green portion of the progress indicator
    // Basically, this covers the entire progress indicator circle.
    // But because we have set the blending mode to srouce-in (BlendMode.srcIn),
    // only the segment that is overlapping with the lighter portion will be visible.
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 155, height: 155),
      vmath.radians(0),
      vmath.radians(this.percent),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Color.fromRGBO(65, 197, 225, 1)
        ..strokeWidth = 40
        ..blendMode = BlendMode.srcIn,
    );
    // we fatten the layer
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    int count = 0;

    for (int i = 0; i < 5; i++) {
      if (todayWork[i] == true) {
        count++;
      }
    }

    double completion = (count / 5) * 100;

    bool checkCompletion() {
      int count = 0;
      for (int i = 0; i < 5; i++) {
        if (todayWork[i] == true) {
          count++;
        }
      }

      if (count == 5) {
        return true;
      } else {
        return false;
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      color: background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome, Dinesh!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Today is Day ${day}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Image(
                    image: AssetImage('assets/images/profile.png'),
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              color: c1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/images/todo.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Today's Challenge",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            fontFamily: "Poppins"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 50, right: 10),
                        child: CustomPaint(
                          painter: MyPainter(completion),
                          child: Column(
                            children: [
                              Text(
                                "${completion}%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Completed",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Text(
                          "To Complete",
                          style: TextStyle(
                              color: index == 0 ? Colors.white : c3,
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                      Visibility(
                        visible: index == 0 ? true : false,
                        child: Container(
                          height: 2,
                          width: 50,
                          color: c2,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Text(
                          "Days",
                          style: TextStyle(
                              color: index == 1 ? Colors.white : c3,
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                      Visibility(
                        visible: index == 1 ? true : false,
                        child: Container(
                          height: 2,
                          width: 50,
                          color: c2,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Text(
                          "Note Today",
                          style: TextStyle(
                              color: index == 2 ? Colors.white : c3,
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                      Visibility(
                        visible: index == 2 ? true : false,
                        child: Container(
                          height: 2,
                          width: 50,
                          color: c2,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Visibility(
                    visible: index == 0 ? true : false,
                    child: Column(
                      children: [
                        Container(
                            height: height,
                            width: MediaQuery.of(context).size.width - 40,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                print(todayWork[index]);
                                if (todayWork[index] == false) {
                                  return ToComplete(
                                    heading: headings[index],
                                    bio: bio[index],
                                    image: 'assets/images/${images[index]}.png',
                                  );
                                } else {
                                  return Container(
                                    height: 0,
                                    width: 0,
                                  );
                                }
                              },
                            )),
                        Visibility(
                          visible: checkCompletion(),
                          child: Container(
                            child: Text(
                              "Congratulation!\nYou Completed You Day ${day}",
                              style: TextStyle(
                                  color: c3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: index == 1 ? true : false,
                    child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 40,
                        child: DatePart()),
                  ),
                  Visibility(
                    visible: index == 2 ? true : false,
                    child: NoteToday(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToComplete extends StatefulWidget {
  ToComplete({Key? key, this.heading, this.bio, this.image}) : super(key: key);

  final image;
  final heading;
  final bio;

  @override
  State<ToComplete> createState() => _ToCompleteState();
}

class _ToCompleteState extends State<ToComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(top: 20),
      height: 90,
      decoration:
          BoxDecoration(color: c5, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image(
            image: AssetImage(widget.image),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
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
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DatePart extends StatefulWidget {
  const DatePart({Key? key}) : super(key: key);

  @override
  State<DatePart> createState() => _DatePartState();
}

class _DatePartState extends State<DatePart> {
  @override
  Widget build(BuildContext context) {
    int start = 0;
    int limit = 74;

    return Container(
      child: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          itemExtent: 25,
          itemBuilder: (context, index) {
            return Container(
              height: 20,
              width: MediaQuery.of(context).size.width - 40,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 33,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, mover) {
                  if (start <= limit) {
                    start++;
                    if (start < day) {
                      return Text(
                        "${start}",
                        style: TextStyle(color: c2),
                      );
                    } else if (start == day) {
                      int count = 0;
                      for (int i = 0; i < 5; i++) {
                        if (todayWork[i] == true) {
                          count++;
                        }
                      }

                      if (count == 5) {
                        return Text(
                          "${start}",
                          style: TextStyle(color: c2),
                        );
                      } else {
                        return Text(
                          "${start}",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    }
                    return Text(
                      "${start}",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                },
              ),
            );
          }),
    );
  }
}

class NoteToday extends StatefulWidget {
  const NoteToday({Key? key}) : super(key: key);

  @override
  State<NoteToday> createState() => _NoteTodayState();
}

class _NoteTodayState extends State<NoteToday> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width - 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        minLines: 5,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                color: c2
              )
            ),
            hintText: 'Enter your Thought',
          hintStyle: TextStyle(
            color: c3
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: c5)
          )
        ),
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}

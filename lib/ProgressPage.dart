import 'package:flutter/material.dart';
import 'contants.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      color: background,
      child: ListView.builder(
        itemCount: completedDays.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(10),
            height: openIndexes[index] ? 240 : 70,
            decoration: BoxDecoration(
                color: c1, borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Day ${completedDays[index][0]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (openIndexes[index] == true) {
                              openIndexes[index] = false;
                            } else {
                              openIndexes[index] = true;
                            }
                          });
                        },
                        icon: Icon(
                          openIndexes[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
                Visibility(
                  visible: openIndexes[index] ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 150,
                          child: ClipRect(
                            child: Image(
                              image: NetworkImage(completedDays[index][1]),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            completedDays[index][2],
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

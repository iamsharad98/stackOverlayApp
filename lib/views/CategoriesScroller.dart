import 'package:flutter/material.dart';

class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller({super.key});

  @override
  State<CategoriesScroller> createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    var _value = true;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff43343d), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        // fillColor: MaterialStateProperty.resolveWith((states) => null),
                        // fillColor: Colors.grey,
                        value: _value,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          print("ontap");
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const Text(
                        "\u{20B9}4247 /mo",
                        style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      const Text(
                        "for 12 months",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "See calculations",
                        style: TextStyle(fontSize: 10, color: Color(0xff72626b), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff7b7390), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // fillColor: MaterialStateProperty.resolveWith((states) => null),
                          // fillColor: Colors.grey,
                          value: _value,
                          shape: const CircleBorder(),
                          onChanged: (bool? value) {
                            print("ontap");
                            setState(() {
                              _value = value!;
                            });
                          },
                        ),
                        const Text(
                          "\u{20B9}4247 /mo",
                          style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        const Text(
                          "for 12 months",
                          style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "See calculations",
                          style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff59698b), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        // fillColor: MaterialStateProperty.resolveWith((states) => null),
                        // fillColor: Colors.grey,
                        value: _value,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          print("ontap");
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      const Text(
                        "\u{20B9}4247 /mo",
                        style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      const Text(
                        "for 12 months",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "See calculations",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:test_project_app/utils/constants.dart';
import 'package:test_project_app/views/test_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsDataFilling = [];
  List<Widget> itemsDataPopped = [];
  List<String> bottomText = [
    "Proceed to EMI selection","Select your bank account","Tap for 1-click KYC"
  ];
  var _initialSliderValue = 150000.0;
  final _animatedListKey = GlobalKey<AnimatedListState>();
  var _context;

  void getPostsData() {
    List<Widget> listItems = [];
    listItems.add(addMoneyToWallet());
    listItems.add(repayMoneyWidget());
    listItems.add(sendMoneyWidget());
    setState(() {
      itemsDataFilling = listItems;
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   getPostsData();
    // });
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // getPostsData();

  }

  Future<bool> _onWillPop() async {
    print("onPop Called");
    // return (await showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title:  const Text('Are you sure?'),
    //     content:  const Text('Do you want to exit an App'),
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: () => Navigator.of(context).pop(false),
    //         child:  const Text('No'),
    //       ),
    //       TextButton(
    //         onPressed: () => Navigator.of(context).pop(true),
    //         child:  const Text('Yes'),
    //       ),
    //     ],
    //   ),
    // )) ?? false;
    removeAboveStackItem(itemsDataFilling.length -2 >= 0 ? itemsDataFilling.length -2 : 0);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final double categoryHeight = size.height*0.30;
    if(itemsDataFilling.isEmpty)
      getPostsData();
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: const Color(0xff121419),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black26,
            leading: const Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.search, color: Colors.black),
              //   onPressed: () {},
              // ),
              IconButton(
                icon: const Icon(Icons.question_mark_rounded, color: Colors.grey),
                onPressed: () {},
              )
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: AnimatedList(
                        key: _animatedListKey,
                        initialItemCount: itemsDataFilling.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index, animation) => _widgetListItem(context, index, animation),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomBar(),
              )
            ],
          ),
        ),
      ),
    );
    // return Scaffold(body: addMoneyToWallet());
  }

  Widget _widgetListItem(BuildContext context, int index, animation) {
    return SlideTransition(
      position: animation.drive(
        // Tween that slides from right to left.
        Tween(begin: const Offset(0.0, 3.0), end: const Offset(0.0, 0.0)),
        // Tween(begin:Offset(0.0, 0.0), end: Offset(0.0, 3.0)),
      ),
      // Simply display the letter.
      child: GestureDetector(
        onTap: (){
          removeAboveStackItem(index);
        },
        child: Align(
            // heightFactor: 0.2,
            heightFactor: 0.1,
            alignment: Alignment.topCenter,
            child: (index >= itemsDataFilling.length) ? Container() : itemsDataFilling[index]),
      ),
    );
  }

  Widget addMoneyToWallet(){
    return Container(
        // height: 500,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: const Color(0xff161921), boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "nikunj, how much do you need?",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, color: Color(0xff8998a6), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "move the dial and set any amount you need upto \n\u{20B9}4,87,891",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Color(0xff414551), fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  if(itemsDataFilling.length != 1)
                    Icon(Icons.arrow_downward_sharp, color: Colors.grey,)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 10,
              ),
              // if(_context != null)
              // GestureDetector(onTap: (){
              //   print("ontap meow 1");
              // },child: Text("meow meow")),
              // Container(
              //   child: Column(
              //     children: [
              //       GestureDetector(onTap: (){
              //         print("ontap meow 2 ");
              //       },child: Text("meow meow")),
              //       GestureDetector(
              //         onTap: (){
              //           print("ontap stash");
              //         },
              //         child: Text(
              //           "stash is instant. money will be credited within\nseconds.",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(fontSize: 12, color: Color(0xffcccecd), fontWeight: FontWeight.w600),
              //         ),
              //       ),
              //       SleekCircularSlider(
              //         appearance: CircularSliderAppearance(
              //             customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15, handlerSize: 10),
              //             angleRange: 360,
              //             size: 250,
              //             startAngle: 270,
              //             customColors: CustomSliderColors(
              //                 trackColor: Color(0xfffceadf),
              //                 progressBarColor: Color(0xffcd8d74)
              //             ),
              //           infoProperties: InfoProperties(
              //             topLabelText: "credit amount",
              //             bottomLabelText: "@ 1.04% monthly",
              //             topLabelStyle: TextStyle(color: Color(0xffafafaf), fontWeight: FontWeight.bold),
              //             // bottomLabelStyle: TextStyle(color: Color(0xffa3af9b), fontWeight: FontWeight.bold),
              //             bottomLabelStyle: TextStyle(color: Colors.green[900]!.withOpacity(0.4), fontWeight: FontWeight.bold),
              //             mainLabelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff252525),
              //             ),
              //             modifier: (double value) {
              //               var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
              //               final roundedValue = format.format(value);
              //               return '$roundedValue';
              //             },
              //           )
              //         ),
              //         min: 0,
              //         max: 500000,
              //         initialValue: 150000,
              //         // innerWidget: (var s ){
              //         //
              //         // },
              //       ),
              //
              //     ],
              //   ),
              // ),
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color(0xffffffff), boxShadow: [
                        BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                            customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15, handlerSize: 10),
                            angleRange: 360,
                            size: 250,
                            startAngle: 270,
                            customColors: CustomSliderColors(
                                trackColor: Color(0xfffceadf),
                                progressBarColor: Color(0xffcd8d74),
                              dotColor: Color(0xff2e2d30)
                            ),
                          infoProperties: InfoProperties(
                            topLabelText: "credit amount",
                            bottomLabelText: "@ 1.04% monthly",
                            topLabelStyle: TextStyle(color: Color(0xffafafaf), fontWeight: FontWeight.bold),
                            // bottomLabelStyle: TextStyle(color: Color(0xffa3af9b), fontWeight: FontWeight.bold),
                            bottomLabelStyle: TextStyle(color: Colors.green[900]!.withOpacity(0.4), fontWeight: FontWeight.bold),
                            mainLabelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff252525),
                            ),
                            modifier: (double value) {
                              var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
                              final roundedValue = format.format(value);
                              return '$roundedValue';
                            },
                          )
                        ),
                        min: 0,
                        max: 500000,
                        initialValue: _initialSliderValue,
                        onChange: (value){
                          setState(() {
                            _initialSliderValue = value;
                          });
                        },
                        // innerWidget: (var s ){
                        //
                        // },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          print("ontap stash");
                        },
                        child: Text(
                          "stash is instant. money will be credited within\nseconds.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Color(0xffcccecd), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              // const SizedBox(
              //   height: 30,
              // ),
              // GestureDetector(
              //   onTap: (){
              //     print("ontap text");
              //   },
              //   child: Container(
              //     height: 20,
              //     width: 30,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ));
    // return SleekCircularSlider(
    //   appearance: CircularSliderAppearance(
    //       customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15, handlerSize: 10),
    //       angleRange: 360,
    //       size: 250,
    //       startAngle: 270,
    //       customColors: CustomSliderColors(
    //           trackColor: Color(0xfffceadf),
    //           progressBarColor: Color(0xffcd8d74)
    //       ),
    //       infoProperties: InfoProperties(
    //         topLabelText: "credit amount",
    //         bottomLabelText: "@ 1.04% monthly",
    //         topLabelStyle: TextStyle(color: Color(0xffafafaf), fontWeight: FontWeight.bold),
    //         // bottomLabelStyle: TextStyle(color: Color(0xffa3af9b), fontWeight: FontWeight.bold),
    //         bottomLabelStyle: TextStyle(color: Colors.green[900]!.withOpacity(0.4), fontWeight: FontWeight.bold),
    //         mainLabelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff252525),
    //         ),
    //         modifier: (double value) {
    //           var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
    //           final roundedValue = format.format(value);
    //           return '$roundedValue';
    //         },
    //       )
    //   ),
    //   onChange: (value){
    //     setState(() {
    //       _initialSliderValue = value;
    //     });
    //   },
    //   min: 0,
    //   max: 500000,
    //   initialValue: _initialSliderValue,
    //   // innerWidget: (var s ){
    //   //
    //   // },
    // );
  }

  Widget repayMoneyWidget(){
    print("itemdatafilling len ${itemsDataFilling.length}");
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: const Color(0xff1a1c29), boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "how do you wish to repay?",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20, color: Color(0xff86909a), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "choose one of our recommended plan or make your\nown",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Color(0xff414551), fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  if(itemsDataFilling.length != 2)
                    Icon(Icons.arrow_downward_sharp, color: Colors.grey,)
                ],
              ),
              // Container(
              //     height: 350,
              //     width: 350,
              //     margin: const EdgeInsets.all(20),
              //     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
              //       BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              //     ]),
              //     child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              //         child: Column(
              //           children: const [
              //             Text(
              //               "nikunj, how much do you need?",
              //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //             ),
              //             Text(
              //               "move the dial and set any amount you need upto\n4,87,891 rs",
              //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         )
              //     )),
              const SizedBox(
                height: 15,
              ),
              categoriesScroller,
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff5e6671),
                          width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Create your own plan", style: TextStyle(color: Color(0xff5e6671), fontWeight: FontWeight.bold),),
                  )
              )
            ],
          )
        ));
  }

  Widget sendMoneyWidget(){
    return Container(
        // height: 500,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: const Color(0xff272a3d), boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "where should we send the money?",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Color(0xff919caf), fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "amount will be credited to this bank account. EMI will also be debited from this bank account",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12, color: Color(0xff4d5466), fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              ListTile(
                // leading: Icon(Icons.food_bank, color: Color(0xffcbcad7), size: 50,),
                leading: Image.asset('assets/images/hdfc_logo.png', ),
                title: Text("HDFC Bank", style: TextStyle(color: Color(0xffcbcad7), fontWeight: FontWeight.bold, fontSize: 16),),
                subtitle: Text("50100117009192", style: TextStyle(color: Color(0xff5d5f6e), fontWeight: FontWeight.w600, fontSize: 12),),
                trailing: Icon(Icons.check_circle, color: Color(0xffcbcad7),),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff8a96a6),
                          width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(25))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Change account", style: TextStyle(color: Color(0xff8a96a6), fontWeight: FontWeight.bold),),
                  )
              )
            ],
          )
        ));
  }

  Widget bottomBar(){
    return GestureDetector(
      onTap: (){
        print("ontap bottombar");
        if(itemsDataPopped.isEmpty) return;
        itemsDataFilling.add(itemsDataPopped.removeLast());
        _animatedListKey.currentState?.insertItem(itemsDataFilling.length-1);
        setState(() {});
      },
      child:
      // (itemsDataFilling.length >0) ?
      Container(
        height: 70,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), color: const Color(0xff3a479b), boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
        child:
        // Container()
        Center(child: Text((bottomText.length < (itemsDataFilling.length) || itemsDataFilling.isEmpty) ? "" : bottomText[itemsDataFilling.length -1],
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),)),

      )
          // : Container()
      ,
    );
  }

  removeAboveStackItem(var index){
    print("index item ${index} ${itemsDataFilling.length}");
    int i = itemsDataFilling.length -1;
    while(itemsDataFilling.isNotEmpty && i != index){
      print("itemsDataFilling len ${itemsDataFilling.length} before");

      int lastIndex = itemsDataFilling.length -1;
      Widget rem = itemsDataFilling.removeAt(lastIndex);
      _animatedListKey.currentState?.removeItem(itemsDataFilling.length -1, (context, animation) => _widgetListItem(context, lastIndex , animation),);
      itemsDataPopped.add(rem);
      print("itemsDataFilling len ${itemsDataFilling.length} after");
      i--;
    }
    // AnimatedList.of(context).removeItem(itemsDataFilling.length -1, (context, animation) => itemsDataFilling.removeLast(), duration: Duration(seconds: 5));
    setState(() {
    });
  }
}

class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller();

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Controller/button_controller.dart';
import 'package:my_calculator/Views/widgets/buttons.dart';
import 'package:my_calculator/Utils/app_strings.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final c = Get.put(ModelBtn());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey.shade700,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Center(child: Text(displayTitle)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column( mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: Obx(
                          () => Text(
                            c.input.value,
                            style: const TextStyle( color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Obx(
                          () => Text(
                            c.output.value,
                            style: const TextStyle( color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: c.myList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card( shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: CalButton(
                          buttonTapped: () {
                            c.operations(index, c.myList);
                            
                          },
                          btnColor: c.colorCondition( index),
                          btnText: c.myList[index],
                          textColor: Colors.white,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

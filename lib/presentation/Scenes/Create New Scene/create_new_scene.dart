import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:iot_application1/widgets/Remotes%20Widgets/remote_card.dart';

class CreateNewScene extends StatefulWidget {
  final List<String> initialSelectedDays =[];

  @override
  State<CreateNewScene> createState() => _CreateNewSceneState();
}

class _CreateNewSceneState extends State<CreateNewScene> {
  List devices = [
    {
      "type": "heading",
      "label": "Living Room",
      "children": [
        {"type": "item", "label": "AC"},
        {"type": "item", "label": "Light"},
        {"type": "item", "label": "Fan"}
      ]
    },
    {
      "type": "heading",
      "label": "Bedroom",
      "children": [
        {"type": "item", "label": "Curtains"},
        {"type": "item", "label": "Tube Light"},
        {"type": "item", "label": "Led"}
      ]
    }
  ];

  bool isEvery = false;
  bool isWeek = false;
  bool isCustom = false;

  TimeOfDay? selectedTime;
  TimeOfDay? selectedTimeOff;
  bool isTimeON = false;
  bool isTimeOFF = false;

  TimeOfDay? picked;
  DateTime? selectedDate;
  Map<String, bool> selectedItems = {};


   List<String>? initialSelectedDays;
  List<String> selectedDays = [];
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];




  Future<void> _selectTime(
    BuildContext context,
  ) async {
    if (isTimeON) {
      picked = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );
      if (picked != null && picked != selectedTime && isTimeON) {
        setState(() {
          selectedTime = picked;
        });
      }
    }

    if (isTimeOFF) {
      final TimeOfDay? pickedOff = await showTimePicker(
        context: context,
        initialTime: selectedTimeOff ?? TimeOfDay.now(),
      );
      if (pickedOff != null &&
          isTimeOFF &&
          ((pickedOff.hour - picked!.hour)>0 ) &&
          pickedOff != selectedTimeOff) {
        setState(() {
          selectedTimeOff = pickedOff;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: PrimaryColors().orangeNormal,
              content: Text(
            'Off time must be greater than On time',
            style: CustomTextStyles.homeTitleLarge2DMSans,
          )),
        );
      }
    }
  }

  void _updateSelection(String name) {
    setState(() {
      if (name == 'Everyday') {
        isEvery = true;
        isWeek = false;
        isCustom = false;
        selectedDate = null;
      } else if (name == 'Week Day') {
        isEvery = false;
        isWeek = true;
        isCustom = false;
        selectedDate = null;
        showDialog(
          context: context,
          builder: (BuildContext context) => showCustomDayPicker(),
        ).then((selectedDays) {
          if (selectedDays != null) {
            setState(() {
              this.selectedDays = List<String>.from(selectedDays);
            });
          }
        });
      } else if (name == 'Custom Date') {
        isEvery = false;
        isWeek = false;
        isCustom = true;
      }
    });
  }



  @override
  void initState(){
    super.initState();
    selectedDays = widget.initialSelectedDays;
  }
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Create Scene",
          style: CustomTextStyles.homeTitleLarge2DMSans,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: screenHeight * 5,
          // ),
          // ///Top app bar
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: screenWidth * 3),
          //       child: GestureDetector(
          //         child: Icon(Icons.arrow_back),
          //         onTap: (){
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //     Text("Create Scene",style: CustomTextStyles.homeTitleLarge2DMSans,),
          //     // Padding(
          //     //   padding: EdgeInsets.only(right: screenWidth * 3),
          //     //   child:FaIcon(FontAwesomeIcons.ellipsis),
          //     // )
          //     Container()
          //   ],
          // ),
          ///Top scheduling button
          SizedBox(
            height: screenHeight * 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.2),
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.04),
              ]),
            ),
            child: TextField(
              style: GoogleFonts.plusJakartaSans(color: Colors.white),
              readOnly: true,
              onTap: () {
                _showMultiSelectBottomSheet(context);
              },
              decoration: InputDecoration(
                  hintText: selectedItems.keys.where((key) => selectedItems[key]!).join(', ') != ''
                      ? selectedItems.keys.where((key) => selectedItems[key]!).join(', ')
                      : 'Select devices',
                  hintStyle: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.3), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.3), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  isDense: true,
                  suffixIcon: Icon(Icons.arrow_drop_down)
                  // prefixIcon: SvgPicture.asset(
                  //   "assets/icons/user.svg",
                  //   height: 10,
                  //   fit: BoxFit.scaleDown,
                  // ),
                  ),
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Schedule".tr,
                style: CustomTextStyles.homeTitleLargeDMSans,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: Text(
              "How often do you want it to be?".tr,
              style: CustomTextStyles.homeTitleSmallDMSans,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          // Text("He;pp"),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                ///Just dummy - Please customize it as per the functionality - I don't know the usability for the bellow widgets
                children: [
                  customChips(context, "Everyday", isEvery),
                  SizedBox(
                    width: screenWidth * 1,
                  ),
                  customChips(context, "Week Day", isWeek),
                  SizedBox(
                    width: screenWidth * 1,
                  ),
                  customChips(context, "Custom Date", isCustom),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 3, right: screenWidth * 3),
              child: Divider(
                color: Colors.grey,
              )),
          SizedBox(
            height: screenHeight * 1,
          ),

          ///Calendar scheduling
          Container(
            color: (isEvery || isWeek) ? Colors.grey.withOpacity(0.3) : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
                  child: Text(
                    "Schedule".tr,
                    style: CustomTextStyles.homeTitleLargeDMSans.copyWith(
                      color: (isEvery || isWeek) ? Colors.grey : Colors.white,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
                  child: Text(
                    "Select the desired dates".tr,
                    style: CustomTextStyles.homeTitleSmallDMSans.copyWith(
                      color: (isEvery || isWeek) ? Colors.grey : Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
                  child: GestureDetector(
                    onTap: (isEvery || isWeek) ? null : () async {
                      if (isCustom == true) {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                            print(selectedDate);
                          });
                        }
                      } else {
                        print("Elese Goto");
                        selectedDate = null;
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: PrimaryColors().orangeNormal,
                            content: Text(
                              'This option is only available for the custom date schedule.',
                              style: CustomTextStyles.homeTitleLarge2DMSans,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          selectedDate != null
                              ? '${selectedDate}'
                              : 'Select the dates'.tr,
                          style: CustomTextStyles.homeTitleLargeDMSans.copyWith(
                            color: (isEvery || isWeek) ? Colors.grey : Colors.white,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        Container(
                          width: screenWidth * 25,
                          height: screenHeight * 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(10),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: (isEvery || isWeek)
                                    ? [Colors.grey, Colors.grey]
                                    : [appTheme.black900, appTheme.orange900],
                              ),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Date here",
                              style: CustomTextStyles.homeTitleSmallDMSans.copyWith(
                                color: (isEvery || isWeek) ? Colors.grey : Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 3, right: screenWidth * 3),
              child: Divider(
                color: Colors.grey,
              )),
          ///Time scheduling
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: Text(
              "Working time".tr,
              style: CustomTextStyles.homeTitleLargeDMSans,
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: Text(
              "Select the desired time interval".tr,
              style: CustomTextStyles.homeTitleSmallDMSans,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            height: screenHeight * 2,
          ),

          ///On time
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    selectedTime != null
                        ? 'Selected time: ${selectedTime!.format(context)}'
                        : "Time ON".tr,
                    style: CustomTextStyles.homeTitleLargeDMSans,
                    overflow: TextOverflow.fade,
                    maxLines: 1),
                GestureDetector(
                  ///Please write down the sate management functionality bellow by using the particular controller
                  onTap: () => {
                    setState(() {
                      isTimeON = true;
                      isTimeOFF = false;
                      _selectTime(context);
                    })
                  },
                  child: Container(
                    width: screenWidth * 25,
                    height: screenHeight * 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          appTheme.black900,
                          appTheme.orange900,
                        ]),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Time here",
                        style: CustomTextStyles.homeTitleSmallDMSans,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 1,
          ),

          ///Off time
          Padding(
            padding:
                EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    selectedTimeOff != null
                        ? 'Selected time: ${selectedTimeOff!.format(context)}'
                        : "Time OFF".tr,
                    style: CustomTextStyles.homeTitleLargeDMSans,
                    overflow: TextOverflow.fade,
                    maxLines: 1),
                GestureDetector(
                  ///Please write down the sate management functionality bellow by using the particular controller
                  onTap: () => {
                    setState(() {
                      isTimeOFF = true;
                      isTimeON = false;
                      _selectTime(context);
                    })
                  },
                  child: Container(
                    width: screenWidth * 25,
                    height: screenHeight * 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          appTheme.black900,
                          appTheme.orange900,
                        ]),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Time here",
                        style: CustomTextStyles.homeTitleSmallDMSans,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.createScene);
                  final selectedDevices = selectedItems.entries
                      .where((entry) => entry.value)
                      .map((entry) => entry.key)
                      .toList();
                  print("Selected devices: $selectedDevices");
                  print("On Time : ${selectedTime}");
                  print("Off Time : ${selectedTimeOff}");
                  print("Date :${selectedDate}");
                  print('Week Day : ${selectedDays}');
                  print("Scedule : =>  Every : ${isEvery} ::: Week : ${isWeek} ::: Custom : ${isCustom}");
               },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 8),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: PrimaryColors().orangeNormal,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: PrimaryColors().pureWhite, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMultiSelectBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: appTheme.blueGray900,
              borderRadius: BorderRadius.circular(22)),
          padding: EdgeInsets.all(20),
          child: StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Devies',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildMultiSelectList(setState),
                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Text('Confirm'),
                  // ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
  // List<String> _selectedItems = [];

  Widget _buildMultiSelectList(setState) {
    List<Widget> widgets = [];
    for (var section in devices) {
      if (section['type'] == 'heading') {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              section['label'],
              style: CustomTextStyles.homeTitleLargeDMSans,
            ),
          ),
        );
        for (var child in section['children']) {
          // print(widgets);
          widgets.add(
            CheckboxListTile(
              title: Text(
                child['label'],
                style: CustomTextStyles.homeTitleSmallDMSans,
              ),
                value: selectedItems[child['label']] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  selectedItems[child['label']] = value ?? false;
                });
              },
            ),
          );
        }
      }
    }
    return Column(
      children: widgets,
    );
  }

  Widget customChips(BuildContext context, String name, bool isSelected) {
    return InkWell(
      onTap: () {
        _updateSelection(name);
        print('${name} + ${isSelected}');
      },
      child: Container(
        height: screenHeight * 6,
        width: screenWidth * 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: isEvery==false?null:Border(bottom: BorderSide(color: Colors.pink)),
          border: isSelected == false
              ? null
              : GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    appTheme.black900,
                    appTheme.orange900,
                  ]),
                  width: 2,
                ),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Center(
          child: Text(
            name,
            style: CustomTextStyles.createHomeTitleLargeDMSans,
          ),
        ),
      ),
      // child: w,
    );
  }

  Widget showCustomDayPicker() {
    return AlertDialog(
      title: Text("Select Week Days"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: double.minPositive,
            child: ListView(
              shrinkWrap: true,
              children: days.map((day) {
                return CheckboxListTile(
                  title: Text(day),
                  value: selectedDays.contains(day),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedDays.add(day);
                      } else {
                        selectedDays.remove(day);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(selectedDays);
          },
        ),
      ],
    );
  }

}

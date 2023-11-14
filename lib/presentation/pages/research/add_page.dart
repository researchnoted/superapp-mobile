import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:superapp_mobile/animation/FadeAnimation.dart';
import 'package:superapp_mobile/common/static.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

import 'package:uuid/uuid.dart';

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dropdown_cupertino/dropdown_cupertino.dart';
import 'package:nfc_manager/nfc_manager.dart';

class AddResearchPage extends StatefulWidget {
  const AddResearchPage({super.key});
  @override
  _AddResearchPageState createState() => _AddResearchPageState();
}

class SelectableItem {
  final String text;
  bool isSelected;

  SelectableItem({
    required this.text,
    this.isSelected = false, // Default isSelected to false
  });
}

List<SelectableItem> components = [
  SelectableItem(text: 'Bahan Kering'),
  SelectableItem(text: 'Protein Kering'),
  SelectableItem(text: 'Bahan Organik'),
  SelectableItem(text: 'Lemak Kering'),
  SelectableItem(text: 'Serat Kering'),
  SelectableItem(text: 'BETN'),
];

class _AddResearchPageState extends State<AddResearchPage>
    with SingleTickerProviderStateMixin {
  int currentStep = 0;
  int totalSteps = 5;
  var logger = Logger();

  Color buttonColor = kgrey;
  Color buttonColor2 = kgrey;
  Color buttonColor3 = kgrey;
  Color buttonColor4 = kgrey;
  Color buttonColor5 = kgrey;
  Color buttonColor6 = kgrey;

  ValueNotifier<String> titleController = ValueNotifier<String>("");
  ValueNotifier<String> descriptionController = ValueNotifier<String>("");
  ValueNotifier<String> locationController = ValueNotifier<String>("");
  ValueNotifier<String> typeController =
      ValueNotifier<String>(""); // Initialize with an empty string
  ValueNotifier<String> fieldController =
      ValueNotifier<String>(""); // Initialize with an empty string

  ValueNotifier<String> startDateResearchController = ValueNotifier<String>("");
  ValueNotifier<String> endDateResearchController = ValueNotifier<String>("");

  ValueNotifier<dynamic> result = ValueNotifier(null);

  void generateCodeAndWriteNFCTag() {
    Logger().i("test");
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      var nfcCode = 'test'.codeUnits;

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime('text/plain', Uint8List.fromList(nfcCode)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      // try {
      //   await ndef.write(message);
      //   result.value = 'Success to "Ndef Write"';
      //   uploadNfcCode(nfcCode);
      //   NfcManager.instance.stopSession();
      // } catch (e) {
      //   result.value = e;
      //   NfcManager.instance.stopSession(errorMessage: result.value.toString());
      //   return;
      // }
    });
  }

  void alertConfirmationDialogCupertino(
      BuildContext context, String title, String content) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 20,
                  color: kblack,
                  fontWeight: FontWeight.bold)),
          content: Text(content,
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 13,
                  color: kblack,
                  fontWeight: FontWeight.w400)),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Cancel",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            CupertinoDialogAction(
              child: Text("Confirm",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400)),
              onPressed: () {
                // Perform the action when the user confirms
                // onPressedCallback; // Close the dialog
                // currentStep == 0
                //     ? postResearch(
                //         titleController.value,
                //         descriptionController.value,
                //         locationController.value,
                //         typeController.value,
                //         fieldController.value,
                //         selectedStartDateResearch,
                //         selectedEndDateResearch)
                //     : currentStep == 1
                //         ? repostResearchComponent()
                //         : currentStep == 3
                //             ? uploadGuideBookResearch(_file)
                //             : print("pass the $currentStep");
                Navigator.of(context).pop();
                setState(() {
                  currentStep++;
                });
              },
            ),
          ],
        );
      },
    );
  }

  late AnimationController loadingController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..addListener(() {
      setState(() {});
    });

  File? _file;
  PlatformFile? _platformFile;

  selectFile() async {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the body in a SingleChildScrollView
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      stepTexts[currentStep],
                      style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      stepSubtexts[currentStep],
                      style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 15,
                          color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildStep(currentStep),
              Column(children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    // Card(
                    //   color: Colors.white,
                    //   shadowColor: Colors.transparent,
                    //   // elevation: 5,
                    //   // shape: RoundedRectangleBorder(
                    //   //   borderRadius: BorderRadius.circular(50),
                    //   // ),
                    //   margin: EdgeInsets.only(top: 0, bottom: 0),
                    //   child: ListTile(
                    //     leading: CircleAvatar(
                    //         backgroundColor: Color(0xFF029456),
                    //         child: Icon(
                    //           Icons.check_circle,
                    //           color: Colors.white,
                    //         )),
                    //     title: Text("12.30 PM",
                    //         style: TextStyle(
                    //             fontFamily: 'Plus Jakarta Sans',
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black)),
                    //     subtitle: Text("Sat, 4 Oct 2023",
                    //         style: TextStyle(
                    //             fontFamily: 'Plus Jakarta Sans',
                    //             fontSize: 12.5,
                    //             color: Colors.grey[700])),
                    //     trailing: Icon(Icons.watch_later),
                    //   ),
                    // ),
                    // Card(
                    //   color: Colors.white,
                    //   shadowColor: Colors.transparent,
                    //   // elevation: 5,
                    //   // shape: RoundedRectangleBorder(
                    //   //   borderRadius: BorderRadius.circular(50),
                    //   // ),
                    //   child: ListTile(
                    //     leading: CircleAvatar(
                    //         backgroundColor: Color(0xFF029456),
                    //         child: Icon(
                    //           Icons.add,
                    //           color: Colors.white,
                    //         )),
                    //     title: Text("10.00 PM",
                    //         style: TextStyle(
                    //             fontFamily: 'Plus Jakarta Sans',
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black)),
                    //     subtitle: Text("Mon, 16 Oct 2023",
                    //         style: TextStyle(
                    //             fontFamily: 'Plus Jakarta Sans',
                    //             fontSize: 12.5,
                    //             color: Colors.grey[700])),
                    //     trailing: Icon(Icons.watch_later),
                    //   ),
                    // ),
                  ],
                ),
              ]),
              FadeAnimation(
                1.5,
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      // Handle the "Next" button click to move to the next step
                      setState(() {
                        currentStep++;
                      });
                    },
                    color: primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      currentStep < totalSteps - 1 ? "Next" : "Generate",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  List<DateTime> selectedDatesUpload = [];

  // Define a DateTime variable with a static time (e.g., 2:30 PM)
  Time _time = Time(hour: 14, minute: 30);

  // Define a callback function for when the time changes
  void _onChangeTime(TimeOfDay newTime) {
    setState(() {
      _time = Time(hour: 14, minute: 30);
    });
  }

  Widget _buildStep(int step) {
    List<Widget> buttonWidgets = [];

    for (var component in components) {
      buttonWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: MaterialButton(
            minWidth: double.infinity,
            height: 50,
            onPressed: () {
              // Handle the button click for this component
              // You can access the component's name using 'component'
              // For example, if you want to print the name:
              // setState(() {
              //   if (component.isSelected) {
              //     selectedComponents
              //         .remove(component.text); // Remove if already selected
              //   } else {
              //     selectedComponents.add(component.text); // Add if not selected
              //   }
              //   component.isSelected = !component.isSelected;
              // });
              Logger().i('selected: ${component.text}');
            },
            color: component.isSelected
                ? primary
                : kgrey, // Assuming primary is defined somewhere
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              component.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    switch (step) {
      // Open Room Section
      case 0:
        return OpenRoomSection(
          titleController: titleController,
          descriptionController: descriptionController,
          locationController: locationController,
          startDateResearchController: startDateResearchController,
          endDateResearchController: endDateResearchController,
          typeController: typeController,
          fieldController: fieldController,
        );
      // Choose Components Section
      case 1:
        return FadeAnimation(
          1.2,
          Column(
            children: buttonWidgets,
          ),
        );
      // Pick Dates & Times Section
      case 2:
        return FadeAnimation(
            1.2,
            Container(
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 60,
                initialSelectedDate: DateTime.parse('2023-09-19'),
                selectionColor: const Color(0xFF029456),
                daysCount: DateTime.parse('2023-09-30')
                    .difference(DateTime.parse('2023-09-19'))
                    .inDays,
                selectedTextColor: Color(0xFFFFFFFF),
                dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    color: kGrey),
                onDateChange: (date) {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      height: 350,
                      value: _time,
                      is24HrFormat: true,
                      accentColor: primary,
                      sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                      sunset: TimeOfDay(hour: 18, minute: 0), // optional
                      duskSpanInMinutes: 120, // optional
                      onChange: _onChangeTime,
                      iosStylePicker: true,
                      okStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                          color: kGrey),
                      cancelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                          color: kGrey),
                    ),
                  );
                  Logger().i("test when clicked");
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ));
      // Upload Guidebook Section
      case 3:
        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: selectFile,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: [10, 4],
                    strokeCap: StrokeCap.round,
                    color: primary,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: primary.withOpacity(.05),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.folder_open,
                            color: primary,
                            size: 40,
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text('Select your file (PDF)',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13)),
                        ],
                      ),
                    ),
                  )),
            ),
            _platformFile != null
                ? Container(
                    padding: EdgeInsets.only(top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selected File',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 13)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primary.withOpacity(0.5), // Border color
                                width: 1.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade200,
                              //     offset: Offset(0, 1),
                              //     blurRadius: 3,
                              //     spreadRadius: 2,
                              //   )
                              // ]
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Icon(
                                    Iconsax.document1,
                                    color: primary,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _platformFile!.name,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${(_platformFile!.size / 1024).ceil()} KB',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade500),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          height: 5,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: primary.withOpacity(0.1),
                                          ),
                                          child: LinearProgressIndicator(
                                            color: primary.withOpacity(0.6),
                                            backgroundColor:
                                                primary.withOpacity(0.3),
                                            value: loadingController.value,
                                          )),
                                      SizedBox(
                                        height: 3,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ))
                : Container(),
            SizedBox(
              height: 20,
            ),
          ],
        );
      case 4:
        return Container();
      default:
        return Container(); // Return an empty container if step is out of bounds
    }
  }
}

class OpenRoomSection extends StatelessWidget {
  const OpenRoomSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
    required this.startDateResearchController,
    required this.endDateResearchController,
    required this.typeController,
    required this.fieldController,
  });

  final ValueNotifier<String> titleController;
  final ValueNotifier<String> descriptionController;
  final ValueNotifier<String> locationController;
  final ValueNotifier<String> startDateResearchController;
  final ValueNotifier<String> endDateResearchController;
  final ValueNotifier<String> typeController;
  final ValueNotifier<String> fieldController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Research Title
      FadeAnimation(
        1.2,
        MyInput(
          label: 'Title',
          inputType: MyInputType.text,
          controller: titleController,
        ),
      ),

      // Research Description
      FadeAnimation(
        1.2,
        MyInput(
          label: 'Description',
          inputType: MyInputType.wysiwyg,
          controller: descriptionController,
        ),
      ),

      // Research Location
      FadeAnimation(
        1.2,
        MyInput(
          label: 'Location',
          inputType: MyInputType.text,
          controller: locationController,
        ),
      ),

      // Research Type (Invivo, Isacco, Invitro)
      FadeAnimation(
        1.2,
        MyInput(
          label: 'Research Type',
          inputType: MyInputType.dropdown,
          controller: typeController,
        ),
      ),

      // Research Field
      FadeAnimation(
        1.2,
        MyInput(
          label: 'Research Field',
          inputType: MyInputType.dropdown,
          controller: fieldController,
        ),
      ),

      // Start Date Research
      FadeAnimation(
        1.2,
        MyInput(
            label: 'Start Date Research',
            inputType: MyInputType.datePicker,
            controller: startDateResearchController),
      ),

      // End Date Research
      FadeAnimation(
        1.2,
        MyInput(
          label: 'End Date Research',
          inputType: MyInputType.datePicker,
          controller: endDateResearchController,
        ),
      ),
    ]);
  }
}

class MyInputType {
  static const text = 'text';
  static const dropdown = 'dropdown';
  static const wysiwyg = 'wysiwyg';
  static const datePicker = 'datePicker';
  static const file = 'file'; // New input type for file selection
}

// enum MyInputType { text, dropdown, wysiwyg, datePicker }

class MyInput extends StatefulWidget {
  final String label;
  final String inputType;
  final ValueNotifier<String> controller;
  final List<String>? dropdownItems; // Added parameter for unique values

  MyInput({
    required this.label,
    required this.inputType,
    required this.controller,
    this.dropdownItems, // Added parameter
  });

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  String type = '';
  String field = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _buildInputWidget(context, widget.controller),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: CupertinoColors.white, // Set the background color here
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2000),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              selectedDate = newDate;
            },
          ),
        );
      },
    );

    if (picked != null) {
      widget.controller.value = picked.toLocal().toString().split(' ')[0];
    }
  }

  Widget _buildInputWidget(
      BuildContext context, ValueNotifier<String> controller) {
    switch (widget.inputType) {
      case MyInputType.text:
        return TextField(
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors.black, // Color of the bottom border when not focused
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                    0xFF029456), // Color of the bottom border when focused
              ),
            ),
            // Other InputDecoration properties...
          ),
          controller: TextEditingController(text: widget.controller.value),
          onChanged: (value) {
            widget.controller.value = value; // Update the controller's value
          },
        );
      case MyInputType.dropdown:
        return Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                readOnly: true,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF029456),
                    ),
                  ),
                ),
                controller: TextEditingController(
                    text: widget.label == 'Research Type' ? type : field),
                onChanged: (value) {
                  widget.controller.value = value;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.label == 'Research Type'
                    ? _openBottomSheet(context)
                    : _openBottomSheet2(context);
              },
              child: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF029456),
                size: 36,
              ),
            ),
          ],
        );
      case MyInputType.wysiwyg:
        return TextField(
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors.black, // Color of the bottom border when not focused
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                    0xFF029456), // Color of the bottom border when focused
              ),
            ),
            // Other InputDecoration properties...
          ),
          controller: TextEditingController(text: widget.controller.value),
          onChanged: (value) {
            widget.controller.value = value; // Update the controller's value
          },
          maxLines: 7,
        );
      case MyInputType.datePicker:
        return DatePickerWidget(
            controller: widget.controller, type: widget.label);
      default:
        return Container();
    }
  }

  _openBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text("Select a research type",
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                widget.controller.value = 'Invivo';
                setState(() {
                  type = 'Invivo';
                });
                Navigator.of(context).pop();
              },
              child: Text("Invivo",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                widget.controller.value = 'Invitro';
                setState(() {
                  type = 'Invitro';
                });
                Navigator.of(context).pop();
              },
              child: Text("Invitro",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                widget.controller.value = 'Insacco';
                setState(() {
                  type = 'Insacco';
                });
                Navigator.of(context).pop();
              },
              child: Text("Insacco",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              // Handle cancel
              Navigator.of(context).pop(); // Close the bottom sheet
            },
            child: Text("Cancel",
                style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }

  _openBottomSheet2(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text("Select a research field",
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                widget.controller.value = 'Laboratory';
                setState(() {
                  field = 'Laboratory';
                });
                Navigator.of(context).pop();
              },
              child: Text("Laboratory",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                widget.controller.value = 'Livestock Field';
                setState(() {
                  field = 'Livestock Field';
                });
                Navigator.of(context).pop();
              },
              child: Text("Livestock Field",
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500)),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              // Handle cancel
              Navigator.of(context).pop(); // Close the bottom sheet
            },
            child: Text("Cancel",
                style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600)),
          ),
        );
      },
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  final ValueNotifier<String> controller; // Add this line
  final String type;

  DatePickerWidget(
      {required this.controller, required this.type}); // Add this constructor

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now(); // Initialize with the current date

  void _selectDate(BuildContext context) async {
    DateTime? picked;

    await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Pick a Date',
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 20,
                  color: kblack,
                  fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 250,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Plus Jakarta Sans',
                        color: kblack,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate,
                    minimumDate: DateTime(2000),
                    maximumDate: DateTime(2101),
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() {
                        selectedDate = newDate;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Choose',
                  style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400)),
              onPressed: () {
                Navigator.of(context)
                    .pop(selectedDate); // Return the selected date
              },
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null) {
        widget.controller.value = value.toLocal().toString().split(' ')[0];
        // if (widget.type == 'Start Date Research') {
        //   selectedStartDateResearch = value.toLocal().toString().split(' ')[0];
        // } else {
        //   selectedEndDateResearch = value.toLocal().toString().split(' ')[0];
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                child: CupertinoTextField(
              controller: TextEditingController(
                text: DateFormat('EEEE, dd MMMM yyyy').format(selectedDate),
              ),
              readOnly: true,
              style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
              onTap: () {
                _selectDate(context);
              },
              padding: EdgeInsets.symmetric(
                  vertical:
                      12), // Add padding to match the TextField's appearance
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CupertinoColors
                        .black, // Color of the bottom border when not focused
                    width: 1.0, // Adjust the border width as needed
                  ),
                ),
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
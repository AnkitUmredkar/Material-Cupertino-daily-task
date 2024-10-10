import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../provider/task1_provider.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<Task1Provider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Material & Cupertino',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(15),
            TextField(
              readOnly: true,
              controller: providerTrue.txtDatePickerController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Date Picker',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      providerTrue.txtDatePickerController.text =
                          '${date.day}/${date.month}/${date.year}';
                    }
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
            const Gap(15),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Phone ringtone'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile(
                                value: 'None',
                                groupValue: 'None',
                                onChanged: (value) {},
                                activeColor: Colors.blue.shade800,
                                title: const Text('None'),
                              ),
                              RadioListTile(
                                value: false,
                                groupValue: 'Candy',
                                onChanged: (value) {},
                                title: const Text('Candy'),
                              ),
                              RadioListTile(
                                value: false,
                                groupValue: 'Crystal',
                                onChanged: (value) {},
                                title: const Text('Crystal'),
                              ),
                              RadioListTile(
                                value: false,
                                groupValue: 'Buzz',
                                onChanged: (value) {},
                                title: const Text('Buzz'),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child:
                  Text('Dialog', style: TextStyle(color: Colors.blue.shade800)),
            ),
            const Gap(15),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: Text('Time Picker',
                  style: TextStyle(color: Colors.blue.shade800)),
            ),
            const Gap(15),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                onDateTimeChanged: (value) {},
              ),
            ),
            const Gap(15),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('CupertinoActionSheet', style: TextStyle(fontWeight: FontWeight.bold)),
                    // message: const Text('Please select the best dessert from the options below.'),
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Task 1',style: TextStyle(color: Colors.black),),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Task 2',style: TextStyle(color: Colors.black),),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Task 3',style: TextStyle(color: Colors.black),),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
              child:
                  Text('Sheet', style: TextStyle(color: Colors.blue.shade800)),
            ),
          ],
        ),
      ),
    );
  }
}

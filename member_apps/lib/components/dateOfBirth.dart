import 'package:flutter/material.dart';

class birthDate extends StatelessWidget {
  birthDate({super.key});

  int selectedDOB = 0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          selectedDOB = pickedDate.millisecondsSinceEpoch ~/ 1000;
        }
      },

      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Tanggal Lahir',
      ),
    );
  }
}
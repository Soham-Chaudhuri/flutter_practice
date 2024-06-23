import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorListTile extends StatelessWidget {
  const DoctorListTile({super.key,required this.doctor,});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: (){},
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30.0,
        backgroundColor: colorScheme.background,
        backgroundImage: ,
      ),
    );
  }
}
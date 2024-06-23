// ignore_for_file: deprecated_member_use

import 'package:doctor_booking_app/shared/cards/appointment_preview_card.dart';
import 'package:doctor_booking_app/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking_app/shared/widgets/list_tiles/doctor_list_tile.dart';
import 'package:doctor_booking_app/shared/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          // backgroundColor: const Color.fromARGB(255, 232, 232, 232),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'Massimo D',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    'Dubai, UAE',
                    style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined)),
            const SizedBox(
              width: 8.0,
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search for Doctors....',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: colorScheme.onSurfaceVariant,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.filter_alt_off_outlined,
                          color: colorScheme.surfaceVariant,
                        ),
                      )),
                ),
              )),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              _DoctorCategories(),
              SizedBox(height: 24.0,),
              _MySchedule(),
              SizedBox(height: 24.0,),
              _NearbyDoctors(),
            ],
          ),
        ));
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SectionTitle(
          title: 'Nearby Doctors',
          action: 'See all',
          onPressed: (){},
        ),
        const SizedBox(height: 8.0,),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index){
            final doctor = Doctor.sampleDoctors[index];
            return DoctorListTile(doctor:doctor);
          },
          separatorBuilder:(context,index){
          return Divider(
            height: 24.0,
            color: colorScheme.surfaceVariant,
          );
        } , itemCount: Doctor.sampleDoctors.length)
      ],
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Schedule',
          action: 'See all',
          onPressed: () {}, 
        ),
        const AppointmentPreviewCard(),
      ],
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          action: 'See all',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values
              .take(5)
              .map((category) => Expanded(
                  child: CircleAvatarWithTextLabel(
                      icon: category.icon, label: category.name)))
              .toList(),
        )
      ],
    );
  }
}

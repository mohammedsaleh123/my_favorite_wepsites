import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:my_favorite_wepsites/features/sections/presentation/views/widgets/delete_section_dialog.dart';

import '../../../data/models/sections_model.dart';
import '../../bussines_logic/sections_cubit/sections_cubit.dart';

// ignore: must_be_immutable
class ListSections extends StatefulWidget {
  ListSections({super.key, required this.sections});
  Sections sections;

  @override
  State<ListSections> createState() => _ListSectionsState();
}

class _ListSectionsState extends State<ListSections> {
  Stream<Uint8List?>? faviconStream;
  @override
  void initState() {
    faviconStream = getUrlImage(widget.sections.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: DeleteSectionDialog(
                  cubit: BlocProvider.of<SectionsCubit>(context),
                  sections: widget.sections,
                ),
              );
            },);
      },
      title: Text(widget.sections.sectionName),
      subtitle: Text(widget.sections.sectionDescription!),
      trailing: SizedBox(
        width: 20.h,
        height: 20.w,
        child: StreamBuilder<Uint8List?>(
          stream: faviconStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Image.memory(snapshot.data!, fit: BoxFit.cover);
            } else {
              return SizedBox(
                width: 18.h,
                height: 18.w,
                child: const CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Stream<Uint8List?> getUrlImage(String websiteUrl) async* {
    final Uri uri =
        Uri.https('www.google.com', '/s2/favicons', {'domain': websiteUrl});
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        yield response.bodyBytes;
      } else {
        throw Exception('Failed to get favicon');
      }
    } catch (e) {
      print('Error: $e');
      yield null;
    }
  }
}

import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class EventImage extends StatefulWidget {
  final image;
  final title;
  final eventdescription;
  EventImage(
      {required this.image,
      required this.title,
      required this.eventdescription,
      super.key});

  @override
  State<EventImage> createState() => _EventImageState();
}

@override
class _EventImageState extends State<EventImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 20,
          icon: const Icon(Icons.arrow_back),
        ),
        title: RichText(
          text: const TextSpan(
              text: 'Event ',
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, //New
                  blurRadius: 25.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Event Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (widget.image != null)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Event Description",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.eventdescription,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:task_onaisa/models/getmodel.dart';

import 'package:task_onaisa/ui/widgets/components.dart';

class ThirdScreen extends StatefulWidget {
  Datum datum;
  ThirdScreen(this.datum);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  var boardconroller = PageController();

  String url;

  double currentindex = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defoaltAppbar(title: "The Third Page"),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Title: ${widget.datum.title}',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Subject: ${widget.datum.subject}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Created_at: ${widget.datum.createdAt}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Updated_at: ${widget.datum.updatedAt}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: widget.datum.medias.length > 0
                    ? PageView.builder(
                        controller: boardconroller,
                        onPageChanged: (int index) {
                          setState(() {
                            currentindex = index.toDouble();
                          });
                        },
                        physics: BouncingScrollPhysics(),
                        itemCount: widget.datum.medias.length ?? 1,
                        itemBuilder: (context, index) {
                          return pageViewItem(
                              widget.datum.medias[index], context);
                        })
                    : Center(
                        child: Text("no media"),
                      ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DotsIndicator(
                dotsCount: widget.datum.medias.length > 0
                    ? widget.datum.medias.length
                    : 1,
                position: currentindex,
                decorator: DotsDecorator(
                  size: const Size.square(
                    12.0,
                  ),
                  activeSize: const Size(40.0, 12.0),
                  activeColor: Colors.blue,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          )),
    );
  }
}

Widget pageViewItem(Media media, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 2,
          child: CachedNetworkImage(
            imageUrl: '${media.media}',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.network(
                "http://58one54zero.joybox-me.com/ArabTeco/storage/app/photos/1626166613512.png"),
            fit: BoxFit.fill,
          )),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${media.type}',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}

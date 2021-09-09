import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_onaisa/bloc/getmedia_bloc.dart';

import 'package:task_onaisa/models/itemmodel.dart';

import 'package:task_onaisa/ui/widgets/components.dart';

class ThirdScreen extends StatelessWidget {
  int id;
  ThirdScreen(this.id);
  var boardconroller = PageController();

  String url;

  double currentindex = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetmediaBloc()..add(GetMediaItemEvent(id)),
        child: Scaffold(
          appBar: defoaltAppbar(title: "The Third Page"),
          body: BlocBuilder<GetmediaBloc, GetmediaState>(
            builder: (context, state) {
              GetmediaBloc mediaBloc = GetmediaBloc.get(context);
              if (state is GetmediaLoudingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetmediaErrorState) {
                return Center(
                  child: Text('no connect'),
                );
              } else if (state is GetmediaSuccessState) {
                return Container(
                    padding: const EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Title: ${state.itemModel.data.title}',
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Subject: ${state.itemModel.data.subject}',
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Created_at: ${state.itemModel.data.createdAt}',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Updated_at: ${state.itemModel.data.updatedAt}',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: state.itemModel.data.medias.length > 0
                              ? PageView.builder(
                                  controller: boardconroller,
                                  onPageChanged: (int index) {
                                    mediaBloc
                                        .add(ChangecurrentIndexEvent(index));
                                  },
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      mediaBloc.itemModel.data.medias.length ??
                                          1,
                                  itemBuilder: (context, index) {
                                    return pageViewItem(
                                        mediaBloc.itemModel.data.medias[index],
                                        context);
                                  })
                              : Center(
                                  child: const Text("no media"),
                                ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DotsIndicator(
                          dotsCount: state.itemModel.data.medias.length > 0
                              ? state.itemModel.data.medias.length
                              : 1,
                          position: mediaBloc.currentindex,
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
                    ));
              } else
                return const Text('some thing woring');
            },
          ),
        ));
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
      const SizedBox(
        height: 20.0,
      ),
      Text(
        '${media.type}',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      const SizedBox(
        height: 30.0,
      ),
    ],
  );
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_onaisa/ui/widgets/components.dart';

class BoardModel {
  final String image;
  final String title;
  final String body;
  BoardModel({this.image, this.title, this.body});
}

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key key}) : super(key: key);
  List<BoardModel> boarding = [
    BoardModel(
        image: '',
        title: 'Mopile Application',
        body:
            ' Service 1 Nulla amet nulla do velit nulla enim. Commodo eiusmod consequat proident laborum ipsum incididunt in sunt mollit culpa consectetur aliquip incididunt anim. Ipsum aliquip irure laboris sit. Officia labore exercitation nisi mollit velit.'),
    BoardModel(
        image: '',
        title: ' Desktop Application',
        body:
            '  Service 2 nulla incididunt duis elit consectetur exercitation. Qui excepteur reprehenderit voluptate cupidatat qui fugiat Lorem proident anim laborum do id consectetur. Nulla officia nisi commodo consectetur excepteur esse culpa incididunt elit ea officia quis ea. Tempor qui ullamco deserunt do qui officia amet.'),
    BoardModel(
        image: 'assets/images/wordpress.png',
        title: 'Web Application',
        body:
            'Service 3 Laboris ea sint incididunt laborum Lorem officia. Deserunt nulla ex do aute cupidatat. Non magna et dolore fugiat proident nisi aliquip esse id commodo proident.'),
  ];

  var boardconroller = PageController();

  double currentindex = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defoaltAppbar(title: "The Third Page"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                  controller: boardconroller,
                  onPageChanged: (int index) {
                    // setState(() {
                    currentindex = index.toDouble();
                    // });
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: boarding.length,
                  itemBuilder: (context, index) {
                    return boardingItem(boarding[index], context);
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                new DotsIndicator(
                  dotsCount: boarding.length,
                  position: currentindex,
                  decorator: DotsDecorator(
                    size: const Size.square(
                      12.0,
                    ),
                    activeSize: const Size(40.0, 12.0),
                    activeColor: Colors.orange,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget boardingItem(BoardModel model, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.contain,
        ),
      ),
      Text(
        '${model.title}',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(
        height: 10.0,
      ),
      Expanded(flex: 1, child: Text('${model.body}')),
      SizedBox(
        height: 50.0,
      ),
    ],
  );
}

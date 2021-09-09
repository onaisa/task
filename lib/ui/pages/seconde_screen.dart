import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_onaisa/bloc/getdata_bloc.dart';
import 'package:task_onaisa/models/getmodel.dart';
import 'package:task_onaisa/ui/pages/third_screen.dart';
import 'package:task_onaisa/ui/widgets/components.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key key}) : super(key: key);
  GetModel getModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetdataBloc()..add(GetAllDataEvent()),
        child: BlocConsumer<GetdataBloc, GetdataState>(
          listener: (context, state) {
            if (state is GetAllDataSuccessState) {
              getModel = state.getModel;
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: defoaltAppbar(title: "The Second Page"),
              body: BlocBuilder<GetdataBloc, GetdataState>(
                  builder: (context, state) {
                if (state is GetAllDataSuccessState) {
                  return ListView.separated(
                      itemBuilder: (context, index) =>
                          listItem(cont: context, datum: getModel.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.0,
                          ),
                      itemCount: getModel.data.length);
                } else if (state is GetAllDataLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetAllDataErrorState) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("no data"),
                  );
                }
              }),
            );
          },
        ));
  }
}

Widget listItem({BuildContext cont, Datum datum}) => InkWell(
      onTap: () {
        navigateTo(cont, ThirdScreen(datum.id));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "tilte: ${datum.title}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "subject : ${datum.subject}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "created at: ${datum.createdAt}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

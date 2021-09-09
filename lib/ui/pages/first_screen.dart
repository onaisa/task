import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_onaisa/bloc/uploadfile_bloc.dart';
import 'package:task_onaisa/ui/pages/seconde_screen.dart';
import 'package:task_onaisa/ui/widgets/components.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key key}) : super(key: key);
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController videocontroller = TextEditingController();
  TextEditingController doccontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  UploadfileBloc filebloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => filebloc = UploadfileBloc(),
        child: BlocConsumer<UploadfileBloc, UploadfileState>(
          listener: (context, state) {
            if (state is UploadImageSUcessState) {
              imagecontroller.text = state.imagepath;
              print(imagecontroller.text);
            }
            if (state is UploadVideoSUcessState) {
              videocontroller.text = state.videopath;
            }
            if (state is UploadDocSUcessState) {
              doccontroller.text = state.docpath;
            }
            if (state is PostDataSuccessState) {
              showToast(text: "post successful", state: ToastStates.SUCCESS);
            }
            if (state is PostDataErrorState) {
              showToast(text: "post unsccessful", state: ToastStates.ERROR);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: defoaltAppbar(title: "The First Page"),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsetsDirectional.all(15.0),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          defaoltTextFormFiled(
                              textController: titlecontroller,
                              labelText: "title",
                              prefixIcon: Icon(Icons.title),
                              textValidator: "title"),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                              controller: subjectcontroller,
                              keyboardType: TextInputType.text,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "subject is requierd";
                                } else if (text.length < 10) {
                                  return " subject should be 10 characters ";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                counterText: "min 10 characters",
                                labelText: "Subject",
                                prefixIcon: Icon(Icons.subject),
                              )),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaoltFileFormFiled(
                            textController: imagecontroller,
                            onTap: () {
                              filebloc.add(UploadImageEvent());
                            },
                            labelText: "select photo",
                            textValidator: "photo",
                            prefixIcon: Icon(Icons.photo),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          BlocBuilder<UploadfileBloc, UploadfileState>(
                            builder: (context, state) {
                              return defaoltFileFormFiled(
                                textController: doccontroller,
                                onTap: () {
                                  filebloc.add(UploadDocEvent());
                                },
                                labelText: "select document",
                                textValidator: "document",
                                prefixIcon: Icon(Icons.document_scanner),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          BlocBuilder<UploadfileBloc, UploadfileState>(
                            builder: (context, state) {
                              return defaoltFileFormFiled(
                                textController: videocontroller,
                                onTap: () {
                                  filebloc.add(UploadVideoEvent());
                                },
                                labelText: "select video",
                                textValidator: "video",
                                prefixIcon: Icon(Icons.video_camera_back),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          BlocBuilder<UploadfileBloc, UploadfileState>(
                            builder: (context, state) {
                              return defoalButton(
                                  text: "upload",
                                  onpressed: () {
                                    if (formKey.currentState.validate()) {
                                      filebloc.add(PostDataEvent(
                                        titlecontroller.text,
                                        subjectcontroller.text,
                                      ));
                                      print(titlecontroller.text);
                                      print(subjectcontroller.text);
                                      print(imagecontroller.text);
                                      print(videocontroller.text);
                                      print(doccontroller.text);
                                    }
                                  });
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defoalButton(
                              text: "go to next page",
                              onpressed: () {
                                navigateTo(context, SecondScreen());
                                print("go");
                              }),
                          const SizedBox(
                            height: 15.0,
                          ),
                          BlocBuilder<UploadfileBloc, UploadfileState>(
                            builder: (context, state) {
                              if (state is PostDataLodingState)
                                return Center(
                                    child: CircularProgressIndicator());
                              else if (state is PostDataErrorState)
                                return Center(child: Text(state.error));
                              return Text('');
                            },
                          )
                        ],
                      ),
                    )),
              ),
            );
          },
        ));
  }
}

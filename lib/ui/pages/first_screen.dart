import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_onaisa/bloc/app_bloc.dart';
import 'package:task_onaisa/bloc/uploadfile_bloc.dart';
import 'package:task_onaisa/ui/pages/seconde_screen.dart';
import 'package:task_onaisa/ui/widgets/components.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key key}) : super(key: key);
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController Imagecontroller = TextEditingController();
  TextEditingController Videocontroller = TextEditingController();
  TextEditingController Doccontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  UploadfileBloc filebloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => filebloc = UploadfileBloc(),
        child: BlocConsumer<UploadfileBloc, UploadfileState>(
          listener: (context, state) {
            if (state is UploadImageSUcessState) {
              Imagecontroller.text = state.image.path;
              print(Imagecontroller.text);
            }
            if (state is UploadVideoSUcessState) {
              Videocontroller.text = state.Video.path;
            }
            if (state is UploadDocSUcessState) {
              Doccontroller.text = state.Doc.path;
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
                            textController: Imagecontroller,
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
                                textController: Doccontroller,
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
                                textController: Videocontroller,
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
                          BlocBuilder<AppBloc, AppState>(
                            builder: (context, state) {
                              AppBloc appbloc = AppBloc();
                              return defoalButton(
                                  text: "upload",
                                  onpressed: () {
                                    if (formKey.currentState.validate()) {
                                      appbloc.add(PostDataEvent(
                                          titlecontroller.text,
                                          subjectcontroller.text,
                                          Imagecontroller.text,
                                          Videocontroller.text,
                                          Doccontroller.text));
                                      print("ok");
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
                          BlocBuilder<AppBloc, AppState>(
                            builder: (context, state) {
                              if (state is PostDataLodingState)
                                return Center(
                                    child: CircularProgressIndicator());
                              else
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
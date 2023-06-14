import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hablandohuevadasf/components/alerts/quick_alert.dart';
import 'package:hablandohuevadasf/provider/form_provider.dart';
import 'package:provider/provider.dart';
import '../components/widgets/banner_swiper.dart';
import '../components/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateProvider>(context);

    final TextEditingController content = TextEditingController();

    final TextEditingController nick = TextEditingController();
    const inputDecoration = InputDecoration(
      counterStyle: TextStyle(fontSize: 15),
      floatingLabelStyle: TextStyle(
          color: Color(
            0xff9d2121,
          ),
          fontSize: 25,
          fontWeight: FontWeight.bold),
      labelText: 'Nombre',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(
          color: Color(0xff9d2121),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
    const inputDecoration2 = InputDecoration(
      // fillColor: Colors.red,
      counterStyle: TextStyle(fontSize: 15),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelStyle: TextStyle(
          color: Color(
            0xff9d2121,
          ),
          fontSize: 25,
          fontWeight: FontWeight.bold),
      labelText: 'Papelito',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(
          color: Color(0xff9d2121),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Papelitos Digitales'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff9d2121),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formState.formKey,
          child: Column(
            children: [
              const BannerSwiper(),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nick,
                      enabled: !formState.submit,
                      validator: (value) {},
                      maxLength: 15,
                      cursorColor: const Color(0xff9d2121),
                      style: const TextStyle(fontSize: 15),
                      decoration: inputDecoration,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: content,
                      enabled: !formState.submit,
                      validator: (value) {},
                      maxLength: 250,
                      cursorColor: const Color(0xff9d2121),
                      style: const TextStyle(fontSize: 15),
                      maxLines: 5,
                      decoration: inputDecoration2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: const Color(0xff9d2121),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: formState.submit
                          ? null
                          : () {
                              formState.submit = true;
                              FirebaseFirestore.instance
                                  .collection("papelitos")
                                  .add(
                                {
                                  'papelito': content.text,
                                  'nick': nick.text,
                                },
                              );
                              alertQuick(context);
                              formState.formKey.currentState!.reset();
                              FocusScope.of(context).unfocus();
                            },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Center(
                          child: Text(
                            formState.submit
                                ? 'Gracias por tu papelito'
                                : 'Enviar',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

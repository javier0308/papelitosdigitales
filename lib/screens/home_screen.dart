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
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _content = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _nick = TextEditingController();
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
                      controller: _nick,
                      validator: (value) {
                        if (value!.isEmpty) return 'Campo vacio';
                        return '';
                      },
                      maxLength: 15,
                      cursorColor: const Color(0xff9d2121),
                      style: const TextStyle(fontSize: 15),
                      decoration: inputDecoration,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _content,
                      validator: (value) {
                        if (value!.isEmpty) return 'Campo vacio';
                        return null;
                      },
                      maxLength: 250,
                      cursorColor: const Color(0xff9d2121),
                      style: const TextStyle(fontSize: 15),
                      maxLines: 5,
                      decoration: inputDecoration2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: const Color(0xff9d2121),
                          shape: const StadiumBorder()),
                      onPressed: formState.submit
                          ? null
                          : () {
                              final String content = _content.text;
                              final String nick = _nick.text;
                              FocusScope.of(context).unfocus();
                              if (!formState.formKey.currentState!.validate()) {
                                return;
                              }
                              formState.submit = true;

                              FirebaseFirestore.instance
                                  .collection("papelitos")
                                  .add(
                                {
                                  'papelito': content,
                                  'nick': nick,
                                },
                              );
                              _nick.text = '';
                              _content.text = '';
                              alertQuick(context);
                              formState.formKey.currentState!.reset();
                            },
                      child: SizedBox(
                        width: 80,
                        child: Center(
                          child: Text(
                            formState.submit ? 'Enviado' : 'Enviar',
                            style: const TextStyle(fontSize: 20),
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

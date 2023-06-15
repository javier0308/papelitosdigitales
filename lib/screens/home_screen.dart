import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/components/alerts/quick_alert.dart';
import 'package:hablandohuevadasf/provider/form_provider.dart';
import 'package:provider/provider.dart';
import '../components/widgets/banner_swiper.dart';
import '../components/widgets/custom_drawer.dart';
import '../config/methods/subit_paper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController content = TextEditingController();

  final TextEditingController nick = TextEditingController();
  @override
  void dispose() {
    content.dispose();
    nick.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<FormStateProvider>(context);

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
        child: Column(
          children: [
            const BannerSwiper(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                    controller: nick,
                    enabled: !formState.submit,
                    maxLength: 15,
                    textCapitalization: TextCapitalization.words,
                    cursorColor: const Color(0xff9d2121),
                    style: const TextStyle(fontSize: 15),
                    decoration: inputDecoration,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: content,
                    enabled: !formState.submit,
                    maxLength: 250,
                    cursorColor: const Color(0xff9d2121),
                    style: const TextStyle(fontSize: 15),
                    maxLines: 5,
                    decoration: inputDecoration2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff9d2121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: formState.submit
                        ? null
                        : () {
                            formState.submit = true;
                            submitPaper(nick.text, content.text);
                            alertQuick(context);
                            nick.text = '';
                            content.text = '';
                            FocusScope.of(context).unfocus();
                          },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.065,
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
    );
  }
}

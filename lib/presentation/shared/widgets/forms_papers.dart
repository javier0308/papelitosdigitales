import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/config/config.dart';

class FormsPapers extends StatelessWidget {
  const FormsPapers({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) return 'Campo vacio';
              return '';
            },
            maxLength: 15,
            cursorColor: primaryColor,
            style: const TextStyle(fontSize: 15),
            decoration: inputDecoration,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) return 'Campo vacio';
              return null;
            },
            maxLength: 250,
            cursorColor: primaryColor,
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
              primary: primaryColor,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              // if (!formState.formKey.currentState!.validate()) {
              //   return;
              // }
              // formState.submit = true;

              // alertQuick(context);
              // formState.formKey.currentState!.reset();
            },
            child: const SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

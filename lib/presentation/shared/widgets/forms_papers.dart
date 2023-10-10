import 'package:flutter/material.dart';
import 'package:hablandohuevadasf/config/config.dart';

class FormsPapers extends StatelessWidget {
  const FormsPapers({super.key});

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: TextStyle(fontSize: 15),
      floatingLabelStyle: TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelText: 'Nombre',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: InputBorder.none,
    );
    const inputDecoration2 = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: TextStyle(fontSize: 15),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelStyle: TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelText: 'Papelito',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: InputBorder.none,
    );
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) return 'Campo vacio';
              return '';
            },
            maxLength: 15,
            cursorColor: primaryColor,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(fontSize: 15),
            decoration: inputDecoration,
          ),
          const SizedBox(height: 5),
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
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.065,
              child: const Center(
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 50)
        ],
      ),
    );
  }
}

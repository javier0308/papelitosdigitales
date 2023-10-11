import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hablandohuevadasf/config/config.dart';
import 'package:hablandohuevadasf/presentation/providers/providers.dart';

class FormsPapers extends ConsumerWidget {
  const FormsPapers({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final paperForm = ref.watch(paperFormProvider);
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: const TextStyle(fontSize: 15),
      floatingLabelStyle: const TextStyle(
          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      labelText: 'Nombre',
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      border: InputBorder.none,
      errorText: paperForm.isFormPosting ? paperForm.title.errorMessage : null,
    );
    final inputDecoration2 = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      counterStyle: const TextStyle(fontSize: 15),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelText: 'Papelito',
      errorText: paperForm.isFormPosting ? paperForm.paper.errorMessage : null,
      focusedBorder: const OutlineInputBorder(
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
            maxLength: 15,
            cursorColor: primaryColor,
            textCapitalization: TextCapitalization.words,
            onChanged: ref.read(paperFormProvider.notifier).onTitleChanged,
            style: const TextStyle(fontSize: 15),
            decoration: inputDecoration,
          ),
          const SizedBox(height: 5),
          TextFormField(
            maxLength: 250,
            cursorColor: primaryColor,
            style: const TextStyle(fontSize: 15),
            onChanged: ref.read(paperFormProvider.notifier).onPaperChanged,
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
            onPressed: paperForm.isFormPosting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    ref.read(paperFormProvider.notifier).onFormSubmit();
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:hablandohuevadasf/shared/shared.dart';

final paperFormProvider =
    StateNotifierProvider<PaperFormNotifier, PaperFormState>((ref) {
  final collection = FirebaseFirestore.instance.collection("papelitos");
  return PaperFormNotifier(collection);
});

class PaperFormNotifier extends StateNotifier<PaperFormState> {
  final CollectionReference<Map<String, dynamic>> collection;
  PaperFormNotifier(this.collection) : super(PaperFormState());

  onTitleChanged(String value) {
    final newTitle = Title.dirty(value);
    state = state.copyWith(
      title: newTitle,
      isValid: Formz.validate([newTitle, state.paper]),
    );
  }

  onPaperChanged(String value) {
    final newPaper = Paper.dirty(value);
    state = state.copyWith(
      paper: newPaper,
      isValid: Formz.validate([newPaper, state.title]),
    );
  }

  // clearTitleForm(String value) {
  //   if (state.isFormPosting) {
  //     value = ' ';
  //     final title = Title.dirty(value);
  //     state = state.copyWith(
  //       title: title,
  //     );
  //   }
  // }

  // clearPaperForm(String value) {
  //   if (state.isFormPosting) {
  //     value = ' ';
  //     final paper = Paper.dirty(value);
  //     state = state.copyWith(
  //       paper: paper,
  //     );
  //   }
  // }

  onFormSubmit() {
    _touchEveryField();
    if (!state.isValid) return;
    final title = state.title.value;
    final paper = state.paper.value;
    collection.add({
      'papelito': paper,
      'nick': title,
    });
    state = state.copyWith(
      isPosting: true,
    );
  }

  _touchEveryField() {
    final title = Title.dirty(state.title.value);
    final paper = Paper.dirty(state.paper.value);
    state = state.copyWith(
      isFormPosting: true,
      title: title,
      paper: paper,
      isValid: Formz.validate([
        title,
        paper,
      ]),
    );
  }
}

class PaperFormState {
  final bool isPosting;
  final bool isFormPosting;
  final bool isValid;
  final Title title;
  final Paper paper;

  PaperFormState({
    this.isPosting = false,
    this.isFormPosting = false,
    this.isValid = false,
    this.title = const Title.pure(),
    this.paper = const Paper.pure(),
  });

  PaperFormState copyWith({
    bool? isPosting,
    bool? isFormPosting,
    bool? isValid,
    Title? title,
    Paper? paper,
  }) =>
      PaperFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosting: isFormPosting ?? this.isFormPosting,
        isValid: isValid ?? this.isValid,
        title: title ?? this.title,
        paper: paper ?? this.paper,
      );
}

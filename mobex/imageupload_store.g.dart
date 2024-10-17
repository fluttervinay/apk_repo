// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imageupload_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageuploadStore on _Imageuploadstore, Store {
  late final _$imageFileAtom =
      Atom(name: '_Imageuploadstore.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_Imageuploadstore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_Imageuploadstore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_Imageuploadstore.pickImage', context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('_Imageuploadstore.uploadImage', context: context);

  @override
  Future<void> uploadImage() {
    return _$uploadImageAsyncAction.run(() => super.uploadImage());
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resepe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResepeStore on _ResepeStore, Store {
  late final _$resepeModalAtom =
      Atom(name: '_ResepeStore.resepeModal', context: context);

  @override
  ResepeModal get resepeModal {
    _$resepeModalAtom.reportRead();
    return super.resepeModal;
  }

  @override
  set resepeModal(ResepeModal value) {
    _$resepeModalAtom.reportWrite(value, super.resepeModal, () {
      super.resepeModal = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_ResepeStore.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$ErrorAtom = Atom(name: '_ResepeStore.Error', context: context);

  @override
  String get Error {
    _$ErrorAtom.reportRead();
    return super.Error;
  }

  @override
  set Error(String value) {
    _$ErrorAtom.reportWrite(value, super.Error, () {
      super.Error = value;
    });
  }

  @override
  String toString() {
    return '''
resepeModal: ${resepeModal},
isloading: ${isloading},
Error: ${Error}
    ''';
  }
}

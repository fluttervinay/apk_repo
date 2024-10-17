// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuetsStore on _quetsstore, Store {
  late final _$quetsAtom = Atom(name: '_quetsstore.quets', context: context);

  @override
  Quets get quets {
    _$quetsAtom.reportRead();
    return super.quets;
  }

  @override
  set quets(Quets value) {
    _$quetsAtom.reportWrite(value, super.quets, () {
      super.quets = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_quetsstore.isloading', context: context);

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

  late final _$ErrorAtom = Atom(name: '_quetsstore.Error', context: context);

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
quets: ${quets},
isloading: ${isloading},
Error: ${Error}
    ''';
  }
}

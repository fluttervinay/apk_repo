// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _register, Store {
  late final _$isloadingAtom =
      Atom(name: '_register.isloading', context: context);

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

  late final _$ErrorAtom = Atom(name: '_register.Error', context: context);

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

  late final _$tokenAtom = Atom(name: '_register.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
Error: ${Error},
token: ${token}
    ''';
  }
}

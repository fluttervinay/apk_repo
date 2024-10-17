// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehical_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehicalStore on _vehicalStore, Store {
  late final _$ErrroAtom = Atom(name: '_vehicalStore.Errro', context: context);

  @override
  String get Errro {
    _$ErrroAtom.reportRead();
    return super.Errro;
  }

  @override
  set Errro(String value) {
    _$ErrroAtom.reportWrite(value, super.Errro, () {
      super.Errro = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_vehicalStore.isloading', context: context);

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

  late final _$vehicalModalAtom =
      Atom(name: '_vehicalStore.vehicalModal', context: context);

  @override
  VehicalModal get vehicalModal {
    _$vehicalModalAtom.reportRead();
    return super.vehicalModal;
  }

  @override
  set vehicalModal(VehicalModal value) {
    _$vehicalModalAtom.reportWrite(value, super.vehicalModal, () {
      super.vehicalModal = value;
    });
  }

  @override
  String toString() {
    return '''
Errro: ${Errro},
isloading: ${isloading},
vehicalModal: ${vehicalModal}
    ''';
  }
}

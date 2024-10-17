// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_resepe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddResepeStore on _AddResepeStore, Store {
  late final _$errorAtom =
      Atom(name: '_AddResepeStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AddResepeStore.isLoading', context: context);

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

  late final _$responseDataAtom =
      Atom(name: '_AddResepeStore.responseData', context: context);

  @override
  Map<String, dynamic>? get responseData {
    _$responseDataAtom.reportRead();
    return super.responseData;
  }

  @override
  set responseData(Map<String, dynamic>? value) {
    _$responseDataAtom.reportWrite(value, super.responseData, () {
      super.responseData = value;
    });
  }

  late final _$addResepeApiAsyncAction =
      AsyncAction('_AddResepeStore.addResepeApi', context: context);

  @override
  Future<void> addResepeApi(
      String body, int postId, int userId, BuildContext context) {
    return _$addResepeApiAsyncAction
        .run(() => super.addResepeApi(body, postId, userId, context));
  }

  @override
  String toString() {
    return '''
error: ${error},
isLoading: ${isLoading},
responseData: ${responseData}
    ''';
  }
}

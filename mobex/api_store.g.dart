// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiStore on _ApiStore, Store {
  late final _$apiDataFutureAtom =
      Atom(name: '_ApiStore.apiDataFuture', context: context);

  @override
  ObservableFuture<List<dynamic>>? get apiDataFuture {
    _$apiDataFutureAtom.reportRead();
    return super.apiDataFuture;
  }

  @override
  set apiDataFuture(ObservableFuture<List<dynamic>>? value) {
    _$apiDataFutureAtom.reportWrite(value, super.apiDataFuture, () {
      super.apiDataFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ApiStore.errorMessage', context: context);

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

  late final _$fetchApiDataAsyncAction =
      AsyncAction('_ApiStore.fetchApiData', context: context);

  @override
  Future<void> fetchApiData() {
    return _$fetchApiDataAsyncAction.run(() => super.fetchApiData());
  }

  @override
  String toString() {
    return '''
apiDataFuture: ${apiDataFuture},
errorMessage: ${errorMessage}
    ''';
  }
}

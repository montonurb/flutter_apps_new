// ignore_for_file: prefer_final_fields

import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int count = 0;

  @observable
  String phrase = "Count: ";

  @action
  void increment() {
    count++;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app/Store/State.dart';
import 'package:flutter_app/Store/Reducers.dart';
import './UI/App.dart';

void main() {
  final store = new Store<CounterState>(reducerCounter, initialState: CounterState.initialState());
  final title = "My Notes";

  runApp(new MyNotes(
    title: title,
    store: store
  ));
}

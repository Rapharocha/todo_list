import 'package:flutter/cupertino.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class HomeController {

  List<TodoModel> todos = [];

  TodoRepository repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

//  HomeState state = HomeState.start;

  HomeController([TodoRepository repository]){
    repository == null ? this.repository = TodoRepository() : this.repository = repository; 
  }

  Future start() async {

    state.value = HomeState.loading;
    try {
      todos = await this.repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

}

enum HomeState  {
  start, loading, success, error
}
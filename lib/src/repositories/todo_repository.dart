import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_model.dart';
//Centralizar o que é externo em uma classe separada
class TodoRepository {

  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio dio]){
    dio == null ? this.dio = Dio() : this.dio = dio;
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
  }

}
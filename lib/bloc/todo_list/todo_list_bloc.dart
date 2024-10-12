
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listviewbloc/bloc/todo_list/todo_list_event.dart';
import 'package:listviewbloc/bloc/todo_list/todo_list_state.dart';

class TodoListBloc extends Bloc<ToDoListEvent, ToDoListState> {

  final List<String> todosList = [];

  TodoListBloc() : super(const ToDoListState()) {
    on<AddToEvent>(_addToDoEvents);
    on<RemoveToEvent>(_removeToDoEvents);
  }

  void _addToDoEvents(AddToEvent event,Emitter<ToDoListState> emit){
    todosList.add(event.name);
    emit(state.copyWith(toDosList: List.from(todosList)));
  }

  void _removeToDoEvents(RemoveToEvent event,Emitter<ToDoListState> emit){
    todosList.remove(event.name);
    emit(state.copyWith(toDosList: List.from(todosList)));
  }
}
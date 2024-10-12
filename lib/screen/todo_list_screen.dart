import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listviewbloc/bloc/todo_list/todo_list_bloc.dart';
import 'package:listviewbloc/bloc/todo_list/todo_list_event.dart';
import 'package:listviewbloc/bloc/todo_list/todo_list_state.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('List with Bloc'),
      ),
      body: BlocBuilder<TodoListBloc, ToDoListState>(
        builder: (context, state) {
          return state.toDosList.isEmpty ? const Center(child: Text('No ToDo found')) : ListView.builder(
              itemCount: state.toDosList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(state.toDosList[index]),
                  trailing: IconButton(onPressed: () {
                    context.read<TodoListBloc>().add(RemoveToEvent(name: state.toDosList[index]));
                  }, icon: const Icon(Icons.delete)),
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoListBloc>().add(const AddToEvent(name: 'Mim'));
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}

import 'package:equatable/equatable.dart';

class ToDoListState extends Equatable{
  const ToDoListState({
    this.toDosList = const []
});

  final List<String> toDosList;


  ToDoListState copyWith({List<String>? toDosList}){
    return ToDoListState(
      toDosList: toDosList ?? this.toDosList
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [toDosList];

}
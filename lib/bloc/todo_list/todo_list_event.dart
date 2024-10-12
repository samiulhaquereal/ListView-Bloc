import 'package:equatable/equatable.dart';

abstract class ToDoListEvent extends Equatable{
const ToDoListEvent();
}

class AddToEvent extends ToDoListEvent{
  const AddToEvent({
    required this.name
});

  final String name;

  @override
  List<Object> get props => [name];
}
class RemoveToEvent extends ToDoListEvent{
  const RemoveToEvent({
    required this.name
  });

  final Object name;

  @override
  List<Object> get props => [name];
}

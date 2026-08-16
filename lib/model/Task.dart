import 'package:equatable/equatable.dart';

class Task extends Equatable {
 final String id ; 
 final String title ; 
 final bool isCompleted ;

 const Task(this.id, this.title, this.isCompleted); 

  @override
  // TODO: implement props
  List<Object?> get props => [id , title , isCompleted];

      
  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      id ?? this.id,
      title ?? this.title,
      isCompleted ?? this.isCompleted,
    );
  
  }
  factory Task.fromJson(Map<String, dynamic> json) {
  return Task(
    json['id'],
    json['title'],
    json['isCompleted'],
  );
}

Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };
}
} 
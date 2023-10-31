enum Priority {low, medium, high}
class Task{
  String name;
  bool active = false;
  Priority p;
  
  Task(this.name, this.p);

  complete(){
    if (!active) {
      active = true;
    } 
  } 
}

void main(){
  Task a = Task("Get Sugar", Priority.medium);
  print(a.active);
}


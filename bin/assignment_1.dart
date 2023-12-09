

void main() {
  StudentManagementSystem n=StudentManagementSystem();
  n.main();
}

abstract class Role{
  void displayRole();
}

class Person implements Role{
  String? name;
  int? age;
  String? address;
  Role? role;

  Person(this.name,this.age,this.address,this.role);

  String? getName(){
    return name;
  }
  int? getAge(){
    return age;
  }
  String? getAddress(){
    return address;
  }

  @override
  void displayRole()
  {
    role?.displayRole();
  }

}

class Student extends Person{
  String? studentId;
  double? grade;
  late List<double> courseScores;

  Student(String name, int age, String address, Role role)
      : super(name, age, address, role) {
    courseScores = [];
  }

  @override
  void displayRole(){
    super.displayRole();
  }

  double calculateAverageScore(){
    if(courseScores.isEmpty){
      return 0.0;
    }

    double sum=courseScores.reduce((a, b) => a+b);
    return sum/courseScores.length;
  }
}

class Teacher extends Person{
  String? TeacherID;
  late List<String> coursesTought;

  Teacher(String name, int age, String address, Role role)
      : super(name, age, address, role) {
    coursesTought = [];
  }

  @override
  void displayRole(){
    super.displayRole();
  }

  void displayCoursesTaught(){
    print("Courses Taught: ");
    for(var course in coursesTought){
      print("- $course");
    }
  }

}

class StudentManagementSystem{
  void main() {
    var student = Student('John Doe', 20, '123 Main St', StudentRole());
    student.courseScores = [90, 85, 82];

    var teacher = Teacher('Mrs. Smith', 35, '456 Oak St', TeacherRole());
    teacher.coursesTought = ['Math', 'English', 'Bangla'];

    print('Student Information:');
    student.displayRole();
    print('Name: ${student.getName()}\nAge: ${student.getAge()}\nAddress: ${student.getAddress()}\nAverage Score: ${student.calculateAverageScore().toStringAsFixed(1)}\n');
    print('Teacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName()}\nAge: ${teacher.getAge()}\nAddress: ${teacher.getAddress()}');
    teacher.displayCoursesTaught();
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}


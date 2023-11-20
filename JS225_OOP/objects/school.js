let school = {
  students: [],
  addStudent(name, year) {
    const VALID_YEARS = ['1st', '2nd', '3rd', '4th', '5th'];
    if (!VALID_YEARS.includes(year)) {
      console.log('Invalid Year');
      return;
    }

    let newStudent = createStudent(name, year);

    this.students.push(newStudent);
    return newStudent;
  },

  enrollStudent(student, course) {
    student.addCourse(course);
  },

  addGrade(student, courseCode, grade) {
    let course = student.listCourses().filter(c => c.code === courseCode)[0];
    course.grade = grade;
  },

  getReportCard(student) {
    student.listCourses().forEach(course => {
      if (course.grade) {
        console.log(`${course.name}: ${String(course.grade)}`);
      } else {
        console.log(`${course.name}: In Progress`);
      }
    });
  },

  courseReport(courseName) {
    let studentsInCourseWithGrades = this.students.filter(student => {
      return student.isEnrolledInCourse(courseName) && student.hasGradeForCourse(courseName);
    });

    let courseGrades = studentsInCourseWithGrades.map(student => {
      let grade = student.listCourses().filter(course => course.name === courseName)[0].grade;
      let studentGradePair = [student.name, grade];
      return studentGradePair;
    });

    if (courseGrades.length === 0) return undefined;

    let average = courseGrades.reduce((sum, pair) => sum += pair[1], 0) / courseGrades.length;

    console.log(`=${courseName} Grades=`);

    courseGrades.forEach(pair => console.log(`${pair[0]}: ${pair[1]}`));

    console.log('---');
    console.log(`Course Average: ${average}`);
  },
};

function createStudent(name, year) {
  let student = {
    name,
    year,
    courses: [],

    info() {
      console.log(`${this.name} is a ${this.year} year student`);
    },

    listCourses() {
      return this.courses;
    },

    addCourse(course) {
      this.courses.push(course);
    },

    findCourseIndex(courseCode) {
      let index = -1;

      this.courses.forEach((course, idx) => {
        if (course.code === courseCode) {
          index = idx;
        }
      });

      return index;
    },

    addNote(code, note) {
      let courseIndex = this.findCourseIndex(code);

      if (courseIndex === -1) {
        console.log('Course does not exist in course list.');
        return;
      }

      let course = this.courses[courseIndex];
      if (course.note === undefined) {
        course.note = note;
      } else {
        course.note += ('; ' + note);
      }
    },

    updateNote(code, note) {
      let courseIndex = this.findCourseIndex(code);

      if (courseIndex === -1) {
        console.log('Course does not exist in course list.');
        return;
      }

      let course = this.courses[courseIndex];
      course.note = note;
    },

    viewNotes() {
      this.courses.forEach(course => {
        if (course.note) {
          let message = course.name + ': ' + course.note;
          console.log(message);
        }
      });
    },

    isEnrolledInCourse(courseName) {
      return this.courses.filter(course => course.name === courseName).length > 0;
    },
  
    hasGradeForCourse(courseName) {
      let grade = this.courses.filter(course => course.name === courseName)[0].grade;
      return typeof grade === 'number';
    },
  };

  return student;
}

// Examples of created student objects with grades; methods on the objects are not shown here for brevity.
// The following are only showing the properties that aren't methods for the three objects

let foo = school.addStudent('foo', '3rd');
school.enrollStudent(foo, { name: 'Math', code: 101 });
school.enrollStudent(foo, { name: 'Advanced Math', code: 102 });
school.enrollStudent(foo, { name: 'Physics', code: 202 });
school.addGrade(foo, 101, 95);
school.addGrade(foo, 102, 90);


let bar = school.addStudent('bar', '1st');
school.enrollStudent(bar, { name: 'Math', code: 101 });
school.addGrade(bar, 101, 91);


let qux = school.addStudent('qux', '2nd');
school.enrollStudent(qux, { name: 'Math', code: 101 });
school.enrollStudent(qux, { name: 'Advanced Math', code: 102 });
school.addGrade(qux, 101, 93);
school.addGrade(qux, 102, 90);

school.getReportCard(foo);
console.log();

school.courseReport('Math');
console.log();

school.courseReport('Advanced Math');
console.log();

console.log(school.courseReport('Physics'));
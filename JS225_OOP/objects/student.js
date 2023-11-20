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
  };

  return student;
}

let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
console.log(foo.listCourses());
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
console.log(foo.listCourses());
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"
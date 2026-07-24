import React from 'react';

const courses = [
  { id: 1, title: 'React Fundamentals', duration: '6 weeks', level: 'Beginner', enrolled: true },
  { id: 2, title: 'Advanced JavaScript', duration: '8 weeks', level: 'Advanced', enrolled: false },
  { id: 3, title: 'Node.js Mastery', duration: '10 weeks', level: 'Intermediate', enrolled: true },
  { id: 4, title: 'Python for Data Science', duration: '12 weeks', level: 'Beginner', enrolled: false },
  { id: 5, title: 'Full Stack Development', duration: '16 weeks', level: 'Advanced', enrolled: true }
];

function CourseDetails() {
  const [showEnrolledOnly, setShowEnrolledOnly] = React.useState(false);

  const displayedCourses = showEnrolledOnly
    ? courses.filter(course => course.enrolled)
    : courses;

  return (
    <div className="details-container">
      <h2>Course Details</h2>

      <div className="toggle-container">
        <label>
          <input
            type="checkbox"
            checked={showEnrolledOnly}
            onChange={(e) => setShowEnrolledOnly(e.target.checked)}
          />
          Show Enrolled Only
        </label>
      </div>

      <div className="table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th>Course Title</th>
              <th>Duration</th>
              <th>Level</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            {displayedCourses.length > 0 ? (
              displayedCourses.map(course => (
                <tr key={course.id}>
                  <td>{course.title}</td>
                  <td>{course.duration}</td>
                  <td>{course.level}</td>
                  <td>
                    {course.enrolled ? (
                      <span className="badge-success">Enrolled</span>
                    ) : (
                      <span className="badge-neutral">Not Enrolled</span>
                    )}
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="4" className="no-data">No courses found</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default CourseDetails;

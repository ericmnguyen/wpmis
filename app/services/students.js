const pool = require("./database");

// Get student list
const getStudentsDb = async () => {
  try {
    // execute will internally call prepare and query
    const [rows] = await pool.query('SELECT * FROM `student`');
    return rows;
  } catch (err) {
    console.log(err);
  }
}

const createStudentDb = async (params) => {
  try {
    // execute creating student query
    const { studentId, firstName, lastName, email, contactNo, courseCode, specialisationCode, year, nationality, userId } = params;
    const [rows] = await pool.query(`
    INSERT INTO student (StudentId, FirstName, LastName, EmailAddress, ContactNo,
      CourseCode, SpecialisationCode, YearEnrolled, Nationality, UserId)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?)`
    , [studentId, firstName, lastName, email, contactNo, courseCode, specialisationCode, year, nationality, userId]);
    return rows;
  } catch (err) {
    return err;
  }
}

const updateStudentDb = async (id, body) => {
  try {
    // execute creating student query
    const { studentId, firstName, lastName, email, contactNo, courseCode, specialisationCode, year, nationality, userId } = body;
    const [rows] = await pool.query(`
    UPDATE student
    SET
      StudentId=?,
      FirstName=?,
      LastName=?,
      EmailAddress=?,
      ContactNo=?,
      CourseCode=?,
      SpecialisationCode=?,
      YearEnrolled=?,
      Nationality=?,
      UserId=?
    WHERE StudentId=?`
    , [studentId, firstName, lastName, email, contactNo, courseCode, specialisationCode, year, nationality, userId, id]);
    return rows;
  } catch (err) {
    return err;
  }
}

const deleteStudentDb = async (id) => {
  try {
    // execute creating student query
    const [rows] = await pool.query(`
    DELETE FROM student WHERE StudentId= ?`
    , [id]);
    return rows;
  } catch (err) {
    return err;
  }
}

module.exports = { getStudentsDb, createStudentDb, updateStudentDb, deleteStudentDb }

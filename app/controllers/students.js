const { getStudentsDb, createStudentDb, deleteStudentDb } = require('../services/students');

const allStudents = async (req, res) => {
  const students = await getStudentsDb();
  return res.status(200).send(students);
}

const createStudent = async (req, res) => {
  const { body } = req;
  const student = await createStudentDb(body);
  if (student?.errno) {
    return res.status(500).send(student);
  }
  return res.status(200).send(student);
}

const deleteStudent = async (req, res) => {
  const { id } = req.params;
  const student = await deleteStudentDb(id);
  if (student?.errno) {
    return res.status(500).send(student);
  }
  return res.status(200).send(student);
}

module.exports = { allStudents, createStudent, deleteStudent };

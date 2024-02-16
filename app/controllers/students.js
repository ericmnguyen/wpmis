const { getStudentsDb } = require('../services/students');

const allStudents = async (req, res) => {
  const students = await getStudentsDb();
  return res.status(200).send(students);
}

const createStudent = (req, res) => {
  console.log('create');
}

module.exports = { allStudents, createStudent };

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

module.exports = { getStudentsDb }

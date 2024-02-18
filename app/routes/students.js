const { allStudents, createStudent, deleteStudent } = require('../controllers/students')
const router = require('express').Router()

// module.exports = routers;
router.get('/all', allStudents);
router.post('/create', createStudent);
router.delete('/:id', deleteStudent);

module.exports = router;

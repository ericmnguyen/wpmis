const { allStudents, createStudent, updateStudent, deleteStudent } = require('../controllers/students')
const router = require('express').Router()

// module.exports = routers;
router.get('/all', allStudents);
router.post('/create', createStudent);
router.put('/:id', updateStudent);
router.delete('/:id', deleteStudent);

module.exports = router;

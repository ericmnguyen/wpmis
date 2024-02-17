const { allStudents, createStudent } = require('../controllers/students')
const router = require('express').Router()

// module.exports = routers;
router.get('/', allStudents);
router.post('/create', createStudent);

module.exports = router;

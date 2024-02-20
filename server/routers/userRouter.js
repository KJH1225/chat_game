const express = require('express');
const router = express.Router();
const UserController = require('../database/controllers/userController');
const authMiddleware = require('../utils/authMiddleware');


router.post('/join', UserController.createUser);
router.post('/login', UserController.loginUser);
router.get('/nick-name', authMiddleware, UserController.getNickName);

router.get('/', (req, res) => {
  res.json({ response: 'userRouter / get' }).status(200);
});

module.exports = router;
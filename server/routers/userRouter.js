const express = require('express');
const router = express.Router();
const UserController = require('../database/controllers/userController');

router.get('/', (req, res) => {
  res.json({ response: 'userRouter / get' }).status(200);
});

router.post('/join', UserController.createUser);
router.post('/login', UserController.loginUser);

router.post('/join', (req, res) => {
  console.log("/user/join req.body: ", req.body);
  res.json({ response: 'userRouter /join post success!' }).status(200);
});

router.post('/login', (req, res) => {
  console.log("/user/join req.body: ", req.body);
  res.json({ response: 'userRouter /join post success!' }).status(200);
});

module.exports = router;
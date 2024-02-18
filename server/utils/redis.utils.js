// redis.util.js
// const redisUtil = require('redis');
const redis = require("redis");
const redisClient = redis.createClient({
	password : process.env.REDIS_PASSWORD,
		socket : {
			host : process.env.REDIS_HOST,
			port : process.env.REDIS_PORT
	},
	legacyMode: true,
})
redisClient.on('connect', () => console.log('Connected to Redis!'));
redisClient.on('error', (err) => console.log('Redis Client Error', err));
redisClient.connect();

module.exports = redisClient;
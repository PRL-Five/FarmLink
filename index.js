const express = require("express");
const bcrypt = require('bcrypt');
const connectdb = require("./mongodb");
const User = require('./model/user');
const Farmer = require('./model/farmer');

connectdb();

const port = 3000;
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Middleware to handle JSON parsing errors
app.use((err, req, res, next) => {
    if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
        console.error('Invalid JSON payload:', err.body);
        res.status(400).send('Invalid JSON payload');
    } else {
        next();
    }
});

// Routes
app.get('/signup', (req, res) => {
    res.send("Signup Page");
});

app.get('/', (req, res) => {
    res.send("Login Page");
});

// User Signup
app.post('/user/signup', async (req, res) => {
    try {
        const { name, password,email } = req.body;

        if (!name || !password) {
            return res.status(400).send("Name and password are required.");
        }

        const existingUser = await User.findOne({ name });

        if (existingUser) {
            return res.status(400).send("User details already exist.");
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = new User({ name, password: hashedPassword ,email});
        await newUser.save();
        res.status(201).send(`Welcome ${name}! Your account has been created.`);
    } catch (error) {
        console.error("Error in /user/signup route:", error);
        res.status(500).send("Error processing signup request.");
    }
});

// User Login
app.post('/user/login', async (req, res) => {
    try {
        const { name, password ,email} = req.body;

        if (!name || !password || !email) {
            return res.status(400).send("Name and password are required.");
        }

        const user = await User.findOne({ name });

        if (user && await bcrypt.compare(password, user.password)) {
            res.status(200).send(`Welcome back, ${name}!`);
        } else {
            res.status(400).send("Incorrect username or password.");
        }
    } catch (error) {
        console.error("Error in /user/login route:", error);
        res.status(500).send("Error processing login request.");
    }
});

// Farmer Signup
app.post('/farmer/signup', async (req, res) => {
    try {
        const { name, password, id } = req.body;

        if (!name || !password || !id) {
            return res.status(400).send("Name, password, and id are required.");
        }

        const existingFarmer = await Farmer.findOne({ name });

        if (existingFarmer) {
            return res.status(400).send("Farmer details already exist.");
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        const newFarmer = new Farmer({ name, password: hashedPassword, id });
        await newFarmer.save();
        res.status(201).send(`Welcome ${name}! Your farmer account has been created.`);
    } catch (error) {
        console.error("Error in /farmer/signup route:", error);
        res.status(500).send("Error processing signup request.");
    }
});

// Farmer Login
app.post('/farmer/login', async (req, res) => {
    try {
        const { name, password } = req.body;

        if (!name || !password) {
            return res.status(400).send("Name and password are required.");
        }

        const farmer = await Farmer.findOne({ name });

        if (farmer && await bcrypt.compare(password, farmer.password)) {
            console.log(req.body);
            res.status(200).send(`Welcome back, ${name}!`);
        } else {
            res.status(400).send("Incorrect username or password.");
        }
    } catch (error) {
        console.error("Error in /farmer/login route:", error);
        res.status(500).send("Error processing login request.");
    }
});

// Test route
app.get('/test', (req, res) => {
    res.send("Test route is working!");
});

// Catch-all route for unhandled requests
app.use((req, res) => {
    res.status(404).send("Resource not found.");
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});











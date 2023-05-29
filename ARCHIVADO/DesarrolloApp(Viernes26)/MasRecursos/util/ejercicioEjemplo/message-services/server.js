// Adrián Navarro Gabino

const mongoose = require('mongoose');
const express = require('express');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const sha256 = require('sha256');
const fs = require('fs');
const jwt = require('jsonwebtoken');
const moment = require('moment');

const secretWord = "DAMsecret";

mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost:27017/messages');

let userSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
            minlength: 1,
            trim: true,
            unique: true,
            match: /^[a-zA-Z0-9]+$/
        },
        password: {
            type: String,
            required: true,
            minlength: 4
        },
        image: {
            type: String,
            required: true
        }
    }
);

let User = mongoose.model('user', userSchema);

let messageSchema = new mongoose.Schema(
    {
        from: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'user',
            required: true
        },
        to: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'user',
            required: true
        },
        message: {
            type: String,
            required: true,
            minlength: 1,
            trim: true
        },
        image: {
            type: String,
            required: false
        },
        sent: {
            type: Date,
            required: true
        }
    }
);

let Message = mongoose.model('message', messageSchema);

let generateToken = name => {
    let token = jwt.sign({name: name}, secretWord, {expiresIn:"30 days"});
    return token;
}

let validateToken = token => {
    try {
        let result = jwt.verify(token, secretWord);
        return result;
    } catch (e) {}
}

let app = express();

app.use(bodyParser.json({limit: '50mb', extended: true}))
app.use(bodyParser.urlencoded({limit: '50mb', extended: true}))
app.use(bodyParser.json());
app.use(methodOverride('_method'));

app.use(express.static('public'));
app.use('/img', express.static(__dirname + '/img'));

app.post('/login', (req, res) => {
    let name = req.body.name;
    let pass = sha256(req.body.password);
    
    User.findOne({name: name, password: pass}).then(data => {
        if(data != null)
        {
            let token = generateToken(data._id);
            let result = {
                ok: true,
                token: token,
                name: name,
                image: data.image
            };
            res.send(result);
        }
        else
        {
            let result = {ok: false, error: "User or password incorrect"};
            res.send(result);
        }
    }).catch(error => {
        let result = {ok: false, error: "Error trying to validate user: " +
            error};
        res.send(result);
    });
});

app.post('/register', (req, res) => {
    let name = req.body.name;
    let pass = req.body.password;
    let image = req.body.image;
    
    const filePath = `img/${Date.now()}.jpg`;
    fs.writeFileSync(filePath, Buffer.from(image, 'base64'));

    let user1 = new User({
        name: name,
        password: sha256(pass),
        image: filePath
    });

    user1.save()
        .then(r =>{
            let result = {ok: true};
            res.send(result);
        })
        .catch(error =>{
            let result = {ok: false, error: "User couldn't be registered"};
            res.send(result);
        });
});

app.get('/users', (req, res) => {
    let token = req.headers['authorization'];
    let error = true;

    if(token)
    {
        if (validateToken(token)) {

            newToken = generateToken(token);
            error = false;

            User.find().then(r => {
                let result = {ok: true, users: r};
                res.send(result);
            })
        }
        else
        {
            let result = {ok: false, error: "Error validating user"};
            res.send(result);
        }
    }

    if(error)
    {
        res.sendStatus(401);
    }
});

app.put('/users', (req, res) => {
    let token = req.headers['authorization'];
    let error = true;

    if(token)
    {
        let validatedToken = validateToken(token);
        if (validatedToken) {

            newToken = generateToken(token);
            error = false;

            User.findById(validatedToken.name).then(u => {
                const filePath = `img/${Date.now()}.jpg`;
                fs.writeFileSync(filePath,
                    Buffer.from(req.body.image, 'base64'));
                u.image = filePath;
                
                u.save().then(u => {
                    let result = {ok: true};
                    res.send(result);
                }).catch(error => {
                    let result = {ok: false, error: "Error updating user: " +
                        validatedToken.name};
                    res.send(result);
                });
            }).catch(error => {
                let result = {ok: false, error: "User not found"};
                res.send(result);
            });
        }
        else
        {
            let result = {ok: false, error: "Error validating user"};
            res.send(result);
        }
    }

    if(error)
    {
        res.sendStatus(401);
    }
});

app.get('/messages', (req, res) => {
    let token = req.headers['authorization'];
    let error = true;

    if(token)
    {
        let validatedToken = validateToken(token);
        if (validatedToken) {
            
            newToken = generateToken(token);
            error = false;

            Message.find({to: validatedToken.name}).populate('from').then(m => {
                
                let result = {ok: true, messages: m};
                res.send(result);
            }).catch(error => {
                
                let result = {ok: false, error: "Error getting messages for " +
                    "user: " + validatedToken.name};
                res.send(result);
            });
        }
        else
        {
            let result = {ok: false, errorMessage: "Error validating user"};
            res.send(result);
        }
    }

    if(error)
    {
        console.log("Error");
        res.sendStatus(401);
    }
});

app.post('/messages/:toUserId', (req, res) => {
    let token = req.headers['authorization'];
    let error = true;

    if(token)
    {
        let validatedToken = validateToken(token);
        if (validatedToken.name) {
            newToken = generateToken(token);
            error = false;

            let image = null;
            let filePath = null;

            if(req.body.image != null)
            {
                image = req.body.image;
                filePath = `img/${Date.now()}.jpg`;
                fs.writeFileSync(filePath, Buffer.from(image, 'base64'));
            }

            let m = new
                Message({
                    from: validatedToken.name,
                    to: req.params.toUserId,
                    message: req.body.message,
                    image: filePath,
                    sent: req.body.sent
                });

            m.save()
                .then(r =>{
                    let result = {ok: true, message: m};
                    res.send(result);
            })
            .catch(error =>{
                console.log(error);
                let result = {ok: false, error: "Error sending a message to: " +
                    req.params.toUserId};
                res.send(result);
            });
        }
        else
        {
            let result = {ok: false, error: "Error validating user"};
            res.send(result);
        }
    }

    if(error)
    {
        res.sendStatus(401);
    }
});

app.delete('/messages/:id', (req, res) => {
    Message.findByIdAndRemove(req.params.id).then(result => {
        let data = {ok: true};
        res.send(data);
    }).catch(error => {
        let data = {ok: false,
            error:"Error deleting message: " + req.params.id};
        res.send(data);
    });
});

app.listen(8080);
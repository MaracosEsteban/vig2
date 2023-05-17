const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')

//const ip = require('ip') // Finding the IP address is Node.js/ https://stackoverflow.com/questions/67778717/how-to-get-the-ip-address-in-node-js-express
const { execSync } = require("child_process");



const app = express()

app.use(bodyParser.json())

const PUERTO = 3000


const conexion = mysql.createConnection(
    {

        host: 'localhost',
        database: 'prueba',
        user: 'root',
        password: ''
    }

)


app.listen(PUERTO, () => {
    console.log(`Servidor corriendo en el perto ${PUERTO}`)
})


// La coneccion se conecte y si huviera algún herror capturarlo


conexion.connect(error => {
    if (error) throw error
    console.log("Conexión exitosa a la base de datos");
})



//console.log(ip.address()) // Finding the IP address is Node.js / https://stackoverflow.com/questions/67778717/how-to-get-the-ip-address-in-node-js-express
const cmd = `curl -s http://checkip.amazonaws.com || printf "0.0.0.0"`;
const pubIp = execSync(cmd).toString().trim();  
console.log(`My public IP address is: ${pubIp}`);


app.get('/', (req, res) => {
    res.send('API')
})


app.get('/usuarios', (req, res) => {
    const query = 'SELECT * FROM usuarios;'
    conexion.query(query, (error, resultado) => {
        if (error) return console.error(error.message)

        const obj = {}
        if (resultado.length > 0) {
            obj.listaUsuarios = resultado
            res.json(obj)
        } else {
            res.json('No hay registros')
        }
    })
})


// ToDo-------------------------Falta  hacer el get usuario por id



// no esta probada
app.post('/usuario/add', (req, res) => {
    const usuario = {
        nombre: req.body.nombre,
        email: req.body.email
    }

    const query = `INSERT INTO usuarios SET ?`
    conexion.query(query, usuario, (error) => {
        if (error) return console.error(error.message)
        res.json('Se inserto correctamente el usuario')
    })
})



// no está probada
app.post('/usuario/update/:id', (req, res) => {
    const { id } = req.params
    const { nombre, email } = req.body

    const query = `UPDATE usuarios SET nombre='${nombre}, email='${email} WHERE idUsuarios='${id}';`
    conexion.query(query, (error) => {
        if (error) return console.error(error.message)
        res.json('Se actualizó correctamente el usuario')
    })
})



// probado desde el navegador (funciona con get)
app.delete('/usuario/delete/:id', (req, res) => {
    const { id } = req.params
    //console.log("El id es : ");
    //console.log(id)
    const query = `DELETE FROM usuarios WHERE idUsuarios=${id};`
    conexion.query(query, (error) => {
        if (error)  console.error(error.message);
        res.json("Se eliminó correctamente el usuario") 
    })
})















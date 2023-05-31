const express = require('express')
const mysql = require('mysql2')
const bodyParser = require('body-parser')

//const ip = require('ip') // Finding the IP address is Node.js/ https://stackoverflow.com/questions/67778717/how-to-get-the-ip-address-in-node-js-express
const { execSync } = require("child_process");
const { Console } = require('console');


const app = express()

app.use(bodyParser.json())

const PUERTO = 3000


const conexion = mysql.createConnection(

    {
        //Para ejecutarlo en Vigilant

        host: 'localhost',
        database: 'prueba',
        user: 'root',
        password: ''


        
        // Para ejecutarlo en mi ordenador
/*
        host: 'localhost',
        database: 'vigapp_database',
        user: 'root',
        password: 'Mc+25156'

*/


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





//S1:-----------------Leer un usuario en base a su nombre(pueden no existir)------------------------------
app.get('/usuario/:nombre', (req, res) => {
    console.log("Se utilizó el servicio S1")
    
    const { nombre } = req.params
    console.log(nombre)
    const query = `SELECT * FROM usuarios WHERE NOMBRE ='${nombre}' ;`
    conexion.query(query, (error, resultado) => {
        var result = [{
            ok: false,
            mensaje: "",
            usuarios: [{}],
        }]
        if (error) {
            result[0].ok = false
            result[0].mensaje = "Error de coneccion"
            result[0].usuarios = [{}]
            res.json(result)
        }
        else {
            const obj = {}
            if (resultado.length > 0) {
                result[0].ok = true
                result[0].mensaje = "Consulta correcta"
                result[0].usuarios = resultado
                res.json(result)
            } else {
                result[0].ok = false
                result[0].mensaje = "No hay registros"
                result[0].usuarios = [{}]
                res.json(result)
            }
        }
    })
})






//S2: ------------------------------------------Leer todos los centros--------------------------------------
app.get('/centros', (req, res) => {
    const query = 'SELECT * FROM centros;'
    console.log("Se utilizo el servicio S2")
    conexion.query(query, (error, resultado) => {
        var result = [{
            ok: false,
            mensaje: "",
            centros: [{}],
        }]
        if (error) {
            result[0].ok = false
            result[0].mensaje = "Error de coneccion"
            result[0].centros = [{}]
            res.json(result)
        }
        else {
            const obj = {}
            if (resultado.length > 0) {
                result[0].ok = true
                result[0].mensaje = "Consulta correcta"
                result[0].centros = resultado
                res.json(result)
            } else {
                result[0].ok = false
                result[0].mensaje = "No hay registros"
                result[0].centros = [{}]
                res.json(result)
            }
        }
    })
})




//S3: ------------------------------------------Generar un registro en la tabla de lectura------------------
app.post('/registro', (req, res) => {
    console.log("Se usa el S3")
    const {ID,FHLOCAL,LATITUD,LONGITUD,USUARIO_ID,CENTRO_ID,OBSERVACION} = req.body[0] // Se desestructura el objeto que paso en req
    const query = `INSERT INTO lecturas (ID,FHLOCAL,LATITUD,LONGITUD,USUARIO_ID,CENTRO_ID,OBSERVACION) VALUES (DEFAULT,NOW(),'${LATITUD}','${LONGITUD}',${USUARIO_ID},${CENTRO_ID},'${OBSERVACION}');`
        conexion.query(query, (error) => {
        var result = [{
            ok: false,
            mensaje: ""
        }]
        if (error) {
            result[0].ok = false
            result[0].mensaje = "Error al conectar con la BBDD"
            res.json(result)
            console.log("se proedujo un error")
            console.log(error)
        }
        else {
            result[0].ok = true
            result[0].mensaje = "Se inserto correctamente"
            res.json(result)
            console.log("se inserto correctamente")
        }
    })
})






//S4: ------------------------------------------Recuperar todos los registros de un usuario entre dos fechas
// para probar el servicio
app.get('/lecturas/:IdUsuario/:FechaDesde/:FechaHasta', (req, res) => {
    console.log("See usa el S4")
   
    const { IdUsuario,FechaDesde,FechaHasta } = req.params


    console.log(IdUsuario)
    console.log(FechaDesde)
    console.log(FechaHasta)


    //const {ID_USUARIO,FECHA_DESDE,FECHA_HASTA} = req.body[0]



    const query = `SELECT cent.NOMBRE AS NOMBRE_CENTRO,lect.FHLOCAL,lect.OBSERVACION,lect.LATITUD,lect.LONGITUD FROM lecturas AS lect INNER JOIN centros AS cent ON lect.CENTRO_id = cent.ID WHERE lect.USUARIO_ID='${IdUsuario}' AND lect.FHLOCAL BETWEEN  '${FechaDesde}' AND '${FechaHasta}'`;
    conexion.query(query, (error, resultado) => {
        var result = [{
            ok: false,
            mensaje: "",
            centros: [{}],
        }]
        if (error) {
            console.log(error)
            result[0].ok = false
            result[0].mensaje = "Error de coneccion"
            result[0].centros = [{}]
            res.json(result)
        }
        else {
            const obj = {}
            if (resultado.length > 0) {
                result[0].ok = true
                result[0].mensaje = "Consulta correcta"
                result[0].centros = resultado
                res.json(result)
            } else {
                result[0].ok = false
                result[0].mensaje = "No hay registros"
                result[0].centros = [{}]
                res.json(result)
            }
        }
    })
})
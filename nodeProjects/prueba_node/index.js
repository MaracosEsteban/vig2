const express = require('express')
const mysql = require( 'mysql')
const bodyParser = from ('body-parser')





const app=express()


app.use(bodyParser.json())

const PUERTO=3000


const conexion =mysql.createConnection(
    {

    host: 'localhost',
    database: 'prueba',
    user: 'root',
    password: ''
    }

)


app.listen(PUERTO,()=> {
    console.log('Servidor corriendo en el perto ${PUERTO}')
})






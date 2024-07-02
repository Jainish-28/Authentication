const express = require("express");
const mongoose= require("mongoose");
const AuthData=require("./model/auth_model");
const databse=require("./database/database_connection");
const router=require("./router/authData_router");
const port=3001;

const app=express();
app.use(express.json());
app.use(express.urlencoded({
    extended:true
}))

app.use(router);

app.listen(port,()=>{
    console.log(`server listening ${port}`);
})
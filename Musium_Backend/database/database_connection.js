const mongoose=require("mongoose");

module.exports= mongoose.connect('mongodb://localhost:27017/musiumAuth').then(()=>console.log("Connected Successfully")).catch((error)=>console.log("error"))

const express= require("express");
const PORT = 5000;
const app = express();

app.get("/hello",(req,res)=>{
    res.send("Hello World");
})

app.listen(PORT,()=>{
    console.log("app is running on port:"+PORT);
})
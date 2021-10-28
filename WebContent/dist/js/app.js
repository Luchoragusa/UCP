const express = requier('express');
const app = express();

app.use(express.static(__dirname + "/dist" + "/xtreme-html"));


app.listen(3000, function(){
    console.log('el servidor se ha iniciado');
});
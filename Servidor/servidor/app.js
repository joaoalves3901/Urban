var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var cors = require("cors");


var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
var pessoasRouter = require("./routes/pessoas");
var rotasRouter = require("./routes/rota");
var adminRouter = require("./routes/admin");
var semanaRouter = require("./routes/semana");
var monitorRouter = require("./routes/monitor");
var artesRouter = require("./routes/artes");



var app = express();

app.use(cors())
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/api/pessoas", pessoasRouter);
app.use("/api/rota", rotasRouter);
app.use("/api/admin", adminRouter);
app.use("/api/semana", semanaRouter);
app.use("/api/monitor", monitorRouter);
app.use("/api/artes", artesRouter);


module.exports = app;

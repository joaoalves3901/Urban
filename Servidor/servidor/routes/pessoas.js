var express = require("express");
var router = express.Router();
var mProd = require("../models/functions");
const cors = require("cors")


router.get('/:id', async function(req, res, next) {
  let PessoaId = req.params.id;
  console.log("Sending Profile with id "+PessoaId);
  let result = await mProd.GetProfileById(PessoaId);
  res.status(result.status).send(result.result);
});

router.post('/login',async function(req, res, next) {
  let email = req.body.email;
  let pass = req.body.pass;
  let result = await mProd.loginPessoa(email,pass);
  res.status(result.status).send(result.result);
});

router.post('/pedirMonitor',async function(req, res, next) {
  let PessoaId = req.body.PessoaId;
  console.log("Pedido enviado with id "+PessoaId);
  let result = await mProd.pedirMonitor(PessoaId);
  res.status(result.status).send(result.result);
});

router.post('/register',async function(req, res, next) {
  let nome = req.body.nome;
  let email = req.body.email;
  let pass = req.body.pass;
  let result = await mProd.registerPessoa(nome,email,pass);
  res.status(result.status).send(result.result);
});

  

router.get("/", async function (req, res, next) {
  let result = await mProd.getAllPessoas();
  res.status(result.status).send(result.result);
});

module.exports = router;

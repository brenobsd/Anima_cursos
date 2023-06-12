const express = require('express');
const pacientesController = require('../controllers/pacientesController');
const routes = express.Router();
const psicologoController = require('../controllers/psicologoController');


routes.post('/psicologo', psicologoController.cadastrarPsicologo);
routes.get('/psicologo', psicologoController.listarPsicologo);
routes.delete('/psicologo/:id_psicologo/delete', psicologoController.deletarPsicologo);
routes.put('/psicologo/:id_psicologo/update', psicologoController.atualizarPsicologo);

routes.get('/paciente', pacientesController.listarPacientes);
routes.post('/paciente', pacientesController.cadastrarPacientes);
routes.put('/paciente/:id_paciente/update', pacientesController.atualizarPacientes);
routes.delete('/paciente/:id_paciente/delete', pacientesController.deletarPacientes);

module.exports = routes
const paciente = require('../models/Paciente');


const pacientesController = {
    async cadastrarPacientes(req, res){
        try{
        const { nome, email, idade } = req.body;
        
        const novoPaciente = await paciente.create({
            nome,
            email,
            idade
            
        });
        res.json(novoPaciente);
        res.status(201).json("Paciente cadastrado com sucesso!");
    
        } catch(error){
            console.log("Erro ao cadastrar paciente")
            console.error(error)
            return res.status(500).json("Erro ao cadastrar paciente")
        }  
    },
    async listarPacientes(req, res){
        try {
            const listarPacientes = await paciente.findAll()
            res.json(listarPacientes)
        } catch (error) {
            res.status(500).json("Erro ao listar pacientes ")
            console.error('Não foi possivel exibir lista')
            console.log('Não foi possivel exibir lista pacientes')
        }
    },
    
    async atualizarPacientes(req, res){
        try {
            const {id_paciente} = req.params;
            const {nome,email,idade} = req.body;

            const pacientesAtualizado = await paciente.update({
                nome,
                email,
                idade},
                {where:{id_paciente}});
            res.json('Paciente atualizado')
            res.status(201)
            
        } catch (error) {
            console.error(error);
            console.log('Não foi possivel atualizar as informações');
            res.status(500);
        }
    },

    async deletarPacientes(req,res){
        try {
            const {id_paciente} = req.params;
            
            await paciente.destroy({
                where:{id_paciente},
            },
            res.status(201),
            res.json('Paciente deletado com sucesso'));

        } catch (error) {
            console.log('Não foi possivel excluir paciente');
            console.error(error);
            res.status(500);
        }
    }
}

module.exports = pacientesController
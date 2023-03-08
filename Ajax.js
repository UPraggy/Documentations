/*
INDICE 

# Ajax
- XmlRequests_1
- XmlRequests_2
- XmlRequests_3
- FETCH API 1
- FETCH API 2
- AXIOS_1
- JQUERY
*/

/*Obs.: 

Para buscar pesquise por '# nome'.


Os programas contem comentarios sobre o assunto, ele pode ser executado para
melhor entendimento, use 'console.log()' para ver as saidas e alterações.
Além disso, os exemplo podem usar arquivos diferentes (abordando o tema de modulos)*/







/*                                      ########################################################### 
                                        ###########################################################
                                        ######################## XmlRequests_1 ####################
                                        ###########################################################
                                        ###########################################################*/

/* O Ajax é um conjunto de tecnicas de desenvolvimento voltadas para 
tratamento e recebimento de requisições, trabalhando de forma assíncrona ele
auxilia na tranferencia de dados entre cliente e servidor,
como o nome diz Ajax é JavaScript com XML assincrono.

Neste modulo será criado um exemplo de como usar o objeto XMLHttpRequest,
o exemplo tem como base um servidor local e seus arquivos são:

- empresas.json -> arquivo com empresas em formato JSON, ou seja, os dados.

- package.json -> arquivo com dependencias.

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- XmlRequests.html -> é a pagina que vai utilizar o ajax e servir os dados de forma
visual, realizando as requisições e tratamento.
*/




/*------ empresas.json --------*/

[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
    {"id":6,"nome":"Universo","capital":50000.00,"pais":"Colombia","mercado":"Imobiliario"},
    {"id":7,"nome":"Witt","capital":1000000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":8,"nome":"VitaSonho","capital":620000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":9,"nome":"Previx","capital":200000.00,"pais":"pais de Gales","mercado":"Alimentos"},
    {"id":10,"nome":"Upper","capital":320000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":11,"nome":"Love & Dream","capital":400000.00,"pais":"França","mercado":"Alimentos"},
    {"id":12,"nome":"Powerful","capital":210000.00,"pais":"Alemanha","mercado":"Tecnologia"}
    ]






/*------ package.json --------*/

{
  "name": "ajax",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "nodemon server.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "nodemon": "1.17.3"
  },
  "dependencies": {
    "body-parser": "1.18.2",
    "express": "4.16.3",
    "multer": "1.3.0"
  }
}






/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())


/*quando vier um requisição do tipo 'get' no teste
ele retorna 'Ok'
*/
app.get('/teste',(reg,res)=> res.send('Ok')) 



//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ XmlRequests.html --------*/


/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>XmlRequests</title>
</head>
<body>
	<style type="text/css">
		#empresas {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 50%;
		}

		#empresas td, #empresas th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 5px;
		}

		#empresas tbody:nth-child(even) {
		  background-color: #dddddd;
		}
	</style>

<table id="empresas">
	<tr>
		<th id="nome">Nome</th>
		<th id="capital">Capital (R$)</th>
		<th id="pais">Pais</th>
		<th id="mercado">Mercado</th>
	</tr>

</table>




<script>
	function ajax(config){

		const xhr = new XMLHttpRequest(); //

		//open(Faz uma requisição do tipo get, passa uma url, e executa assincrono) config.url
		xhr.open(config.metodo, config.url, true);
		xhr.send() //envia a requisição
		xhr.onload = e => { //processa a requisição após ser respondida
			if (xhr.status === 200){ //se a requisição for sucesso
				config.sucesso(xhr.response) 
			}
			else if (xhr.status >= 400){ //se a requisição não for sucesso
				config.erro({
					code: xhr.status,
					text: xhr.statusText
				})
			}
		}


	}


	function cria_tabela(append_, nome, capital, pais, mercado){ //cria uma tabela utilizando dados
		const message =  `<tr>
			<td>`+nome+`</td>
			<td>`+capital+`</td>
			<td>`+pais+`</td>
			<td>`+mercado+`</td>
			</tr>`;
		document.querySelector(append_).insertAdjacentHTML('beforeend', message) //inserir html dentro de um elemento
	}


	ajax({
		url: 'empresas.json', //arquivo json com empresas
		metodo: 'GET', //metodo para 'pedir' dados, (POST -> enviar, GET -> Solicitar)
		sucesso(resposta){
		const empresas = JSON.parse(resposta)
		empresas.forEach((val, i)=>{
			cria_tabela('#empresas',val.nome,val.capital.toFixed(2),val.pais,val.mercado)
		})
		},
		erro(e){ //retorna mensagem de erro
			const msg = `<div>${e.code}: ${e.text}</div>`; 
			document.querySelector('#empresas').insertAdjacentHTML('afterend', msg) 
		}
	})
</script>
</body>
</html>


*/
































/*                                      ########################################################### 
                                        ###########################################################
                                        ######################## XmlRequests_2 ####################
                                        ###########################################################
                                        ###########################################################*/

/* 
Neste modulo será criado um exemplo de upload de arquivos:

- file.txt -> arquivo aleatorio. (tente fazer upload de um arquivo grande para teste)

- package.json -> arquivo com dependencias (mesmo do modulo anterior).

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- XmlRequests.html -> é a pagina que vai utilizar o ajax, receber o arquivo
e enviar para o servidor, atraves do POST
*/




/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())


const multer = require('multer')

const storage = multer.diskStorage({ //parte de armazenamento de arquivos
	destination: function (req, file, callback){
		callback(null,'.') //definindo pasta local para armazenar os arquivos
	},
	filename: function (req, file, callback){ //definindo nome do arquivo
		callback(null,`${Date.now()}_${file.originalname}`)
	}
})


//arquivo -> nome do input do arquivo que vai vim na requisição
const upload = multer({storage}).single('arquivo') 


app.post('/upload',(req,res)=>{ //atraves de post a requisição do arquivo vai ser na url /upload
	upload(req, res, err => { //assim que feito o upload ele chama essa função
		if (err){
			return res.end("ERRO ENCONTRADO")
		}

		res.end("Concluido com sucesso")
	})

})

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ XmlRequests2.html --------*/


/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>XmlRequests2</title>
</head>
<body>
	
	<input id="file_up" type="file" name="arquivo">
	<div class="progresso">
		<input type="range" name="" min='0' max='100' value='0'>
		<div id='progresso_atual'></div>
	</div>
	<script>
		

		function AjaxUpload(config){
			const xhr = new XMLHttpRequest();

			if (xhr.upload){ //se upload estiver presente no objeto faça o upload
				xhr.upload.onprogress = e => { //controla o progresso
					const atual = e.loaded // progresso atual
					const total = e.total //tamanho do arquivo

					const percentual = Math.floor(atual / total * 100) //calcula percentual

					config.progresso({atual, total, percentual}) //função callback
				}
			}

			xhr.open("post", config.url, true)
			xhr.send(config.formData) //envia o arquivo atraves do formulario para o servidor
		}

		document.querySelector('#file_up').onchange = e => {
			const formData = new FormData() //criar um formdata
			const inputFile = e.target
			formData.append(inputFile.name, inputFile.files[0]) //pega o nome do input e o primeiro arquivo

			AjaxUpload({
				url : 'upload',
				formData: formData,
				progresso(dados){
					const progresso = document.querySelector('.progresso input[type = range]')
					progresso.value = dados.percentual;

					//adiciona a div progresso o progresso
					document.querySelector('#progresso_atual').innerHTML = JSON.stringify(dados)
				}
			})
		}

	</script>
</body>
</html>
*/




















/*                                      ########################################################### 
                                        ###########################################################
                                        ######################## XmlRequests_3 ####################
                                        ###########################################################
                                        ###########################################################*/

/* 
Neste modulo será criado um exemplo de leitura com base em um arquivo XML:

- empresas.xml -> arquivo com empresas em formato XML, ou seja, os dados.

- package.json -> arquivo com dependencias (mesmo do modulo anterior).

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- XmlRequests.html -> é a pagina que vai utilizar o ajax, receber o arquivo
e enviar para o servidor, atraves do POST
*/



/*------ empresas.xml --------*/

/*
<empresas>
	<empresa id="1"  nome="Inovare" capital="15000.00" pais="Brasil" mercado="Tecnologia"/>
	<empresa id="2"  nome="Best Place" capital="250000.00" pais="Alemanha" mercado="Imobiliario"/>
	<empresa id="3"  nome="Cultural Store" capital="1580000.00" pais="EUA" mercado="Comercio"/>
	<empresa id="4"  nome="Requint" capital="300000.00" pais="Brasil" mercado="Tecnologia"/>
	<empresa id="5"  nome="Digimund" capital="100000.00" pais="Alemanha" mercado="Alimentos"/>
	<empresa id="6"  nome="Universo" capital="50000.00" pais="Colombia" mercado="Imobiliario"/>
	<empresa id="7"  nome="Witt" capital="1000000.00" pais="EUA" mercado="Geral"/>
	<empresa id="8"  nome="VitaSonho" capital="620000.00" pais="Alemanha" mercado="Tecnologia"/>
	<empresa id="9"  nome="Previx" capital="200000.00" pais="pais de Gales" mercado="Alimentos"/>
	<empresa id="10" nome="Upper" capital="320000.00" pais="Alemanha" mercado="Tecnologia"/>
	<empresa id="11" nome="Love and Dream" capital="400000.00" pais="França" mercado="Alimentos"/>
	<empresa id="12" nome="Powerful" capital="210000.00" pais="Alemanha" mercado="Tecnologia"/>

</empresas>
*/



/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())


const multer = require('multer')

const storage = multer.diskStorage({ //parte de armazenamento de arquivos
	destination: function (req, file, callback){
		callback(null,'.') //definindo pasta local para armazenar os arquivos
	},
	filename: function (req, file, callback){ //definindo nome do arquivo
		callback(null,`${Date.now()}_${file.originalname}`)
	}
})


//arquivo -> nome do input do arquivo que vai vim na requisição
const upload = multer({storage}).single('arquivo') 


app.post('/upload',(req,res)=>{ //atraves de post a requisição do arquivo vai ser na url /upload
	upload(req, res, err => { //assim que feito o upload ele chama essa função
		if (err){
			return res.end("ERRO ENCONTRADO")
		}

		res.end("Concluido com sucesso")
	})

})

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ XmlRequests2.html --------*/


/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>XmlRequests</title>
</head>
<body>
	<style type="text/css">
		#empresas {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 50%;
		}

		#empresas td, #empresas th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 5px;
		}

		#empresas tbody:nth-child(even) {
		  background-color: #dddddd;
		}
	</style>

<table id="empresas">
	<tr>
		<th id="nome">Nome</th>
		<th id="capital">Capital (R$)</th>
		<th id="pais">Pais</th>
		<th id="mercado">Mercado</th>
	</tr>

</table>




<script>
	function ajax(config){

		const xhr = new XMLHttpRequest(); 
		xhr.open(config.metodo, config.url, true);
		xhr.send()
		xhr.onreadystatechange = e => { //quando o estado muda

			if (xhr.readyState === 4){ // requisição terminada
				if (xhr.status === 200){ 
					config.sucesso(xhr.responseXML) //chama a response convertendo xml em objeto
				}
				else if (xhr.status >= 400){ 
					config.erro({
						code: xhr.status,
						text: xhr.statusText
					})
				}
			}
		}		
	}


	function cria_tabela(append_, nome, capital, pais, mercado){
		const message =  `<tr>
			<td>`+nome+`</td>
			<td>`+capital+`</td>
			<td>`+pais+`</td>
			<td>`+mercado+`</td>
			</tr>`;
		document.querySelector(append_).insertAdjacentHTML('beforeend', message) //insert html
	}

	ajax({
		url: 'empresas.xml', //api com json de valores moedas
		metodo: 'GET',
		sucesso(resposta){
		resposta = resposta.getElementsByTagName('empresa') //pegando todas empresas e tranformando
		resposta = Array.from(resposta) //tranformando em um array
		
		resposta.forEach((val, i)=>{
			val = val.attributes //pegando os atributos
			cria_tabela('#empresas',val.nome.value,parseInt(val.capital.value).toFixed(2),val.pais.value,val.mercado.value)
		})
		},
		erro(e){
			const msg = `<div>${e.code}: ${e.text}</div>`;
			document.querySelector('#empresas').insertAdjacentHTML('afterend', msg) 
		}
	})
</script>
</body>
</html>
*/




















/*                                      ########################################################### 
                                        ###########################################################
                                        ######################### FETCH API 1 #####################
                                        ###########################################################
                                        ###########################################################*/


/*
Mesmo tendo o XmlHttpRequest como opção para trabalhar com Ajax,
o Fetch Api entrou como uma forma mais simples para trabalhar com Ajax


Neste modulo será criado um exemplo de leitura:

- empresas.json -> arquivo com empresas em formato JSON, ou seja, os dados.

- package.json -> arquivo com dependencias (mesmo do modulo anterior).

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- Fetch1.html -> é a pagina que vai utilizar o ajax e servir os dados de forma
visual, realizando as requisições e tratamento.

*/





/*------ empresas.json --------*/

[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
    {"id":6,"nome":"Universo","capital":50000.00,"pais":"Colombia","mercado":"Imobiliario"},
    {"id":7,"nome":"Witt","capital":1000000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":8,"nome":"VitaSonho","capital":620000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":9,"nome":"Previx","capital":200000.00,"pais":"pais de Gales","mercado":"Alimentos"},
    {"id":10,"nome":"Upper","capital":320000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":11,"nome":"Love & Dream","capital":400000.00,"pais":"França","mercado":"Alimentos"},
    {"id":12,"nome":"Powerful","capital":210000.00,"pais":"Alemanha","mercado":"Tecnologia"}
    ]



/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ Fetch1.html --------*/


/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Fetch Api</title>
</head>
<body>
	<style type="text/css">
		#empresas {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 50%;
		}

		#empresas td, #empresas th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 5px;
		}

		#empresas tbody:nth-child(even) {
		  background-color: #dddddd;
		}
	</style>

<table id="empresas">
	<tr>
		<th id="nome">Nome</th>
		<th id="capital">Capital (R$)</th>
		<th id="pais">Pais</th>
		<th id="mercado">Mercado</th>
	</tr>

</table>


<script>
	const url = './empresas.json'
	fetch(url)
		.then(res => res.json()) //converte a resposta
		.then(empresas => empresas.forEach((valor,i) =>{ //insere na tabela
			cria_tabela('#empresas', valor.nome, valor.capital, valor.pais, valor.mercado)
		}))

	function cria_tabela(append_, nome, capital, pais, mercado){
		const message =  `<tr>
			<td>`+nome+`</td>
			<td>`+capital+`</td>
			<td>`+pais+`</td>
			<td>`+mercado+`</td>
			</tr>`;
		document.querySelector(append_).insertAdjacentHTML('beforeend', message) //insert html
	}

</script>
</body>
</html>
*/
























/*                                      ########################################################### 
                                        ###########################################################
                                        ######################### FETCH API 2 #####################
                                        ###########################################################
                                        ###########################################################*/


/*
Realizando POST

Neste modulo será criado um exemplo de submit form:

- package.json -> arquivo com dependencias (mesmo do modulo anterior).

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- Fetch2.html -> é a pagina que vai utilizar o ajax, receber um formulario
e enviar para o servidor, atraves do POST

*/





/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())


/*o nome da url deve ser o mesmo que o do formulario*/
app.post('/formulario',(req,res)=>{ 
	res.send({
		...req.body, //pegando dados do corpo do formulario
		id: 1
	})

})
//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ Fetch2.html --------*/


/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Fetch Api</title>
</head>
<body>
	
	<form id='um_form' name="meu_form" action="formulario" method="POST">
		<input type="text" name="nome">
		<select name="animais" id="selector_animais">
			<option value="gato">Gato</option>
			<option value="cachorro">Cachorro</option>
			<option value="cavalo">Cavalo</option>
			<option value="urso">Urso</option>
		</select>
		<button type='submit' id='sub_button'></button>
	</form>

	<div id="dados"></div>
<script>


	document.meu_form.onsubmit = async e => {
		e.preventDefault() //impedindo a submissão automatica
		const form = e.target;
		const dados =  new FormData(form);
		dados.append('text',true) //é possível adicionar mais dados após a submissão

		const options = {
			method : form.method,
			body: new URLSearchParams(dados), //passando os dados na submissão
		}

		fetch(form.action, options)
			.then(resp => resp.json())
			.then(resp => {
				console.log(JSON.stringify(resp))
				document.querySelector('#dados').innerHTML += JSON.stringify(resp)
			})
	}
	

</script>
</body>
</html>


*/






/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### AXIOS_1 #######################
                                        ###########################################################
                                        ###########################################################*/

/*
Cliente http semelhante ao fetch e muito usado em React, porém ele é uma biblioteca
de terceiros, ele não é do proprio browser, ele tem também mais compatibilidade

Neste modulo será criado um exemplo de leitura:

- empresas.json -> arquivo com empresas em formato JSON, ou seja, os dados.

- package.json -> arquivo com dependencias (mesmo do modulo anterior).

- Server.js -> responsavel por ativar o servidor e gerenciar as requisições de dados,
prover arquivos estaticos e outras funcionalidades.

- Axios1.html -> é a pagina que vai utilizar o ajax e servir os dados de forma
visual, realizando as requisições e tratamento.
*/




/*------ empresas.json --------*/

[
    {"id":1,"nome":"Inovare","capital":150000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":2,"nome":"Best Place","capital":250000.00,"pais":"Alemanha","mercado":"Imobiliario"},
    {"id":3,"nome":"Cultural Store","capital":1580000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":4,"nome":"Requint","capital":300000.00,"pais":"Brasil","mercado":"Tecnologia"},
    {"id":5,"nome":"Digimund","capital":100000.00,"pais":"Alemanha","mercado":"Alimentos"},
    {"id":6,"nome":"Universo","capital":50000.00,"pais":"Colombia","mercado":"Imobiliario"},
    {"id":7,"nome":"Witt","capital":1000000.00,"pais":"EUA","mercado":"Comercio Geral"},
    {"id":8,"nome":"VitaSonho","capital":620000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":9,"nome":"Previx","capital":200000.00,"pais":"pais de Gales","mercado":"Alimentos"},
    {"id":10,"nome":"Upper","capital":320000.00,"pais":"Alemanha","mercado":"Tecnologia"},
    {"id":11,"nome":"Love & Dream","capital":400000.00,"pais":"França","mercado":"Alimentos"},
    {"id":12,"nome":"Powerful","capital":210000.00,"pais":"Alemanha","mercado":"Tecnologia"}
    ]



/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ Axios1.html --------*/



/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Axios1</title>
</head>
<body>
	
<style type="text/css">
		#empresas {
		  font-family: arial, sans-serif;
		  border-collapse: collapse;
		  width: 50%;
		}

		#empresas td, #empresas th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 5px;
		}

		#empresas tbody:nth-child(even) {
		  background-color: #dddddd;
		}
	</style>

<table id="empresas">
	<tr>
		<th id="nome">Nome</th>
		<th id="capital">Capital (R$)</th>
		<th id="pais">Pais</th>
		<th id="mercado">Mercado</th>
	</tr>

</table>



<!-- Axios pode ser importado através de CDN ou é possível baixar o arquivo -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


	const url = './empresas.json'
	axios(url) //o axios disponibiliza os dados já convertidos 
		.then(empresas => empresas.data.forEach((valor,i) =>{ //insere na tabela
			cria_tabela('#empresas', valor.nome, valor.capital, valor.pais, valor.mercado)
		}))

	function cria_tabela(append_, nome, capital, pais, mercado){
		const message =  `<tr>
			<td>`+nome+`</td>
			<td>`+capital+`</td>
			<td>`+pais+`</td>
			<td>`+mercado+`</td>
			</tr>`;
		document.querySelector(append_).insertAdjacentHTML('beforeend', message) //insert html
	}
	

</script>
</body>
</html>

*/









/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### AXIOS_2 #######################
                                        ###########################################################
                                        ###########################################################*/


/*
Post e get atraves do axios
*/

/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())

app.get('/multiplicaPor2',(req,res)=>{
	//req.query -> na url /?parametro=valor 
	// req.body 
	// req.params -> para parametros na URL /valor
	const valor = req.query.number * 2

	res.send({
		valor
	})
})



app.post('/formulario',(req,res)=>{ 
	res.send({
		...req.body,
		id: 1
	})

})

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ Axios2.html --------*/



/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Axios2</title>
</head>
<body>
	
 
<div id="get">GET > </div>

<div id="post">POST > </div>



<!-- Axios pode ser importado através de CDN ou é possível baixar o arquivo -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>



	function exibeDados(id,dados){
		const texto = JSON.stringify(dados);
		document.getElementById(id).innerHTML += texto;
	}
	
	axios.get('multiplicaPor2',{ //get de dados
		params:{
			number : 6
		}

	}).then(resp => exibeDados('get',resp.data))

	axios.post('formulario',{ //enviando um post de dados
		params:{
			nome: 'meuNome',
			sobrenome : 'sobre nome'
		}

	}).then(resp => exibeDados('post',resp.data))


</script>
</body>
</html>

*/







/*                                      ########################################################### 
                                        ###########################################################
                                        ########################### JQUERY ########################
                                        ###########################################################
                                        ###########################################################*/



/*
Post e get atraves do Jquery
*/

/*------ Server.js --------*/

/*responsavel por fazer o parse do body da requisição (para formularios ou parametros) e   
preparar para serem usados dentro do arquivo server.js*/
const bodyParser = require('body-parser') 
// servidor web
const express = require('express')
const app = express()

//identificar e servir todos os arquivos estaticos da pasta
app.use(express.static('.')) 
//se vier um dado em forma de fomulario ele vai ler e transormar em objeto
app.use(bodyParser.urlencoded({extended: true})) 
//transforma o json em objeto
app.use(bodyParser.json())

app.get('/multiplicaPor2',(req,res)=>{
	//req.query -> na url /?parametro=valor 
	// req.body 
	// req.params -> para parametros na URL /valor
	const valor = req.query.number * 2

	res.send({
		valor
	})
})



app.post('/formulario',(req,res)=>{ 
	res.send({
		...req.body,
		id: 1
	})

})

//Inicia servidor na porta 8080
app.listen(8000, () => console.log('executando'))










/*------ Jquery.html --------*/



/*
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Jquery</title>
</head>
<body>
	
 
<div id="get">GET > </div>

<div id="post">POST > </div>



<!-- Jquery pode ser importado através de CDN ou é possível baixar o arquivo -->
<script
  src="https://code.jquery.com/jquery-3.6.3.min.js"
  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
  crossorigin="anonymous"></script>
<script>



	function exibeDados(id,dados){
		const texto = JSON.stringify(dados);
		document.getElementById(id).innerHTML += texto;
	}
	

	$.ajax({
		url : 'multiplicaPor2', //url para interagir com o servidor
		data :{ //dados
			number : 7
		},
		success(data){ //se sucesso
			exibeDados('get',data)
		}
	})

	$.ajax({
		url : 'formulario',
		method : 'post',
		data :{
			nome: 'meuNome',
			sobrenome : 'sobre nome'
		},
		success(data){
			exibeDados('post',data)
		},
		error(e){
			exibeDados('post',e)
		}
	})

</script>
</body>
</html>

*/












 //                                                           REFERENCIAS


/*
https://developer.mozilla.org/pt-BR/docs/Web/API/XMLHTTPRequest


https://www.udemy.com/course/curso-web/

https://www.hostinger.com.br/tutoriais/o-que-e-ajax
*/
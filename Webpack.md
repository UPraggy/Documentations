# WebPack

## INDICE 
- **[Introdução](#introducao)**
- **[Setup Inicial](#setup-inicial)**
- **[Padrão de Projeto Gulp](#padrão-de-projeto-gulp)**
- **[Nota](#nota)**



# INTRODUCAO


### WebPack é semelhante ao gulp, pois ambos são voltados na automatização do build do projeto, porém sua diferença é na organização em que o gulp utiliza de tasks que chamam outras e o WebPack que se baseia em módulos. O sitema comum de módulos, é o module.export, require, etc, onde o Node se baseia, já o WebPack se baseia no sistema com export e import que veio com o ECMA Script 2015, 



# SETUP INICIAL
### ------------ Arquivo package.json ----------
#### Inicie seu projeto no e coloque em seu package.json as seguintes dependencias e instale logo em seguida
```json
"scripts": {
    "start" : "webpack",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
"dependencies": {
    "webpack": "4.8.1",
    "webpack-cli": "2.1.3",
  }
```

Após isso, instale as dependencias


# PRIMEIRO PROJETO
                                        
#### Para este exemplo criaremos uma classe exemplo, e a executaremos usando webpack


### Pasta src

#### Criando e exportando classe exemplo
#### ------------ Arquivo dog.js ------------
```js
/*utilizando export default,
possibilitamos o acesso externo da classe
*/
export default class Cachorro{ 
	falar(){
		return "Au! Au!"
	}
} 
```

#### ------------ Arquivo principal.js ------------
```js
import DOG from './dog' //importando classe

const cachorro = new DOG; //instanciando

console.log(cachorro.falar()) //executando
```

### Pasta Inicial

#### configurando WebPack

#### ------------ Arquivo webpack.config.js ------------
```js
/*configurando WebPack*/

const webpack = require("webpack"); //importando
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
module.exports = { 
	mode: "development", 
	entry: "./src/principal.js",
	plugins :[
		new MiniCssExtractPlugin({
			filename: "estilo.css",//nome do arquivo
		})
		],
	module: {
		rules: [{
			test: /\.css$/,//expressão regular para ler arquivos .css
			use : [
				    MiniCssExtractPlugin.loader,
				    "css-loader",
				    //"style-loader",
				]
		}]
	}
}
```


### Executando WebPack
#### Após criar os arquivos e configurar o webpack basta executa-lo,através do comando:

```terminal
npm start
```
#### Feito isso, será gerado um arquivo dentro da pasta dist com nome "main.js", onde conterá todo o código, podendo ser interpretado pelo browser, caso queira. Texte executar o arquivo main.js:

```terminal
npm start && node dist/main.js

SAIDA

Au! Au!
```


### Outras configurações opcionais
#### É possível configurar o nome e para onde o arquivo gerado vai ir:

#### ------------ Arquivo webpack.config.js ------------
```js
const webpack = require("webpack"); //importando

module.exports = {
	mode: "development", 
	entry: "./src/principal.js",
	output: {
		filename: "arquivoGerado.js", //modifique o nome do seu arquivo de saida
		path : __dirname + "/destino" //use __dirname, para setar o caminho da pasta atual, e adicione a pasta desejada
	}
}
```


# IMPORTANDO CSS
#### No webpack para que ele reconheça arquivos de extensão css, ele utiliza modulos e plugins que auxiliam nessa leitura ou parse. Abaixo as dependêcias utilizadas:
#### mini-css-extract-plugin -> gerar um arquivo de estilo final<br>style-loader -> Em vez de gerar um arquivo .css, ele insere o css atraves de uma DOM, dentro do arquivo main.js<br>css-loader -> responsável por ler e interpretar urls e imports.

### ------------ Arquivo package.json ----------
```json
"dependencies": {
    "webpack": "4.8.1",
    "mini-css-extract-plugin" : "0.4.0",
    "css-loader" : "0.28.11",
    "style-loader" : "0.21.0",
    "webpack-cli": "2.1.3"
  }
```

### ------------ Arquivo webpack.config.js ------------
```js
/*configurando WebPack*/
const webpack = require("webpack"); //importando
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = { 
	mode: "development", 
	entry: "./src/principal.js",
	plugins :[
		new MiniCssExtractPlugin({
			filename: "estilo.css",//nome do arquivo

		})
		],
	module: {
		rules: [{
			test: /\.css$/,//expressão regular para ler arquivos .css
			use : [
					MiniCssExtractPlugin.loader,
				    "css-loader",
				    //"style-loader",
				]
		}]
	}
}
```

### Para este exemplo crie um arquivo .css de exemplo

## Pasta Dist

### ------------ Arquivo index.html ------------
```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DOCUMENTO TESTE</title>
	<link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
	


<script src="principal.js"></script>
</body>
</html>
```
## Pasta src/assets/css
### ------------ Arquivo teste.css ------------
```css
body{
background-color : #BAD;
}
```

## Pasta src
### ------------ Arquivo principal.js ------------
```js
import DOG from './dog' 
import "./assets/css/teste.css"
const cachorro = new DOG;

console.log(cachorro.falar()) 
```



# Configurando Ambiente de Desenvolvimento e Produção e Otimizações
#### Neste modulo, será configurado o webpack de forma a minificar os arquivos caso set para o modo de produção, e apenas orgarnizar os demais caso seja desenvolvimento



### ------------ Arquivo package.json ----------
#### Build serve para rodar em modo produção
```json
"scripts": {
    "start" : "webpack",
    "build" : "cross-env NODE_ENV=production webpack"
  },
"dependencies": {
    "webpack": "4.8.1",
    "cross-env": "5.1.5",
    "optimize-css-assets-webpack-plugin" : "4.0.1",
    "terser-webpack-plugin": "4.2.3",
    "mini-css-extract-plugin" : "0.4.0",
    "css-loader" : "0.28.11",
    "style-loader" : "0.21.0",
    "webpack-cli": "2.1.3",
    "nodemon": "^2.0.21"
  }
```
#### "croos-env" -> possiblita setar uma variavel de ambiente suportada em "todos" sistemas operacionais
#### "optimise-css-assets-webpack-plugin" -> Responsavel por minificar os arquivos css, já que o webpack ainda não contém um plugin para css
#### "uglify-webpack-plugin" -> Responsavel por minificar os arquivo
    


### ------------ Arquivo webpack.config.js ------------
```js
/*configurando WebPack*/
const modeDev = process.env.NODE_ENV !== "production"; // verificando qual tipo de modo está rodando
const webpack = require("webpack"); 
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const OptimizeCssAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const TerserPlugin = require('terser-webpack-plugin');


module.exports = { 
	mode: modeDev ? "development" : "production" , //setando o modo
	entry: "./src/principal.js",
	plugins :[
		new MiniCssExtractPlugin({
			filename: "estilo.css",
		})
		],
	module: {
		rules: [{
			test: /\.css$/,
			use : [
				    MiniCssExtractPlugin.loader,
				    "css-loader",
				    //"style-loader",
				]
		}]
	},
	optimization:{
		minimizer: [
			new TerserPlugin({// minificando js
    			parallel: true,//executando o mais rapido possivel
    			terserOptions: {
        		ecma: 6,
    			},
			}),

			new OptimizeCssAssetsPlugin({}) //minificando css
		]
	}
}
```

### Rodando em ambos os modos

#### Para rodar como produção digite no terminal:
```terminal
npm run build
```
#### Para rodar como desenvolvimento digite no terminal:
```terminal
npm start
```

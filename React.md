# React

## INDICE 
- **[Start](#start)**
- **[Introdução](#introdução)**
- **[Primeiro Componente](#primeiro-componente)**
- **[Passagens de Argumentos](#passagens-de-argumentos)**
- **[Multiplos Componentes](#multiplos-componentes)**
- **[Usestate](#usestate)**
- **[Classes Components](#classes-components)**
- **[Contenção](#contenção)**
- **[Herdando Components](#herdando-components)**
- **[Useeffect](#useeffect)**
- **[Variaveis Globais](#variaveis-globais)**
- **[Mudando Paginas](#mudando-paginas)**
 




## Obs.: 

Os programas contem comentarios sobre o assunto, ele pode ser executado para
melhor entendimento, tente remover os comentários ao copiar e colar o codigo,
pois React usa jsx e não aceita um tipo especifico de formatação.
Além disso, os exemplo podem usar arquivos diferentes (abordando o tema de modulos)







# START 


#### React organiza tudo em componentes e não linguagens não é html nem js é tudo junto ele utiliza jsx que é a junção dos dois, lembrando que jsx é mais sensivel e necessita fechar todas as tags



#### Para iniciar um projeto react é preciso instalar o modulo
```cmd
npm i -g create-react-app //para instalação global
```

#### Após isso, para criar seu projeto, basta digitar:
```cmd
create-react-app <nome_do_seu_projeto>
```

#### Ele vai setar as dependencias, criar os arquivos, com uma aplicação inicial padrão. e para iniciar basta entrar pelo terminal na pasta e digitar 
```cmd
npm start
```

# INTRODUÇÃO 




Após criar seu primeiro app é necessário entender oque o React está fazendo. Basicamente, dentro do diretório src existe o arquivo index.js, ele lida com a renderização da pagina, importando seus componentes, e colocando dentro do html. O html fica na pagina public, que seria como o "cliente", o html que recebe oque o index.js insere se chama index.html. Dificilmente, será preciso mexer na pagina index.html, todas suas configurações serão externas, organizando em componentes.<br><br> Para iniciar o seu projeto, você pode apagar todos os arquivos dentro da pasta src, pois é onde está um projeto padrão e onde vai ficar o seu. Depois de apagar, para criar sua primeira aplicação, crie o arquivo index.js, importe os modulos react (para componentes) e react-dom (para renderizar)

```js
import React from 'react'
import ReactDOM from 'react-dom'

const element = <h2>My Text</h2> //seu primeiro elemento/componente

ReactDOM.render(element, document.getElementById('root'))
//ReactDOM.render recebe o elemento e onde vai ser inserido
```


#### O modo mais recomendado até a criação desse tutorial é utilizar o modulo react-dom/client. March 29th, 2022. ReactDOM.render has been deprecated <br> Basta criar uma constante chamada 'root' criar o root direcionando ao elemento root do index.html, e dar .render() para renderizar seu elemento

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
const element = <h2>My Text</h2> 

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  element
);

```



# PRIMEIRO COMPONENTE 




#### Crie uma pasta para organizar seus componentes em src do seu projeto e crie seu arquivo jsx com o nome do seu componente maiusculo (isso é uma convenção, para que seja mais legivel), dentro dele exporte sua função para que possa ser acessada por fora.

```js
export default function(){
	return 'texto aleatorio'
}
```

#### E dentro do arquivo index.js importe ele colocando seu caminho relativo. <br>Ao importar o nome após o importe pode ser qualquer um, desde que inicie com letra maiuscula

```js
import Meu_componente from './components/Meu_componente' 
```


#### Para renderizar dentro do root use o componente como uma tag, lembre de sempre fechar a tag

```js
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <Meu_componente/>
);
```




__________________________________

#### Além de função anônima ele aceita arrow. <br> Nota: Sempre que usar JSX importe o react (import React from 'react')

### -----Meu_componente.jsx-----

```js
import React from 'react'
export default () => <h1>Texto aleatorio</h1>
```

### -----index.js-----
```js
import Meu_componente from './components/Meu_componente' 

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <Meu_componente/>
);

```



# PASSAGENS DE ARGUMENTOS 


#### Por convenção os parametros/argumentos devem ter nome 'props' props nada mais é que um objeto, com todos os argumentos. <br>Neste exemplo foi criada uma pasta dentro de src, chamada components para melhor organização. Além disso, foi criado um componente chamado 'SomaNumeros' e armazenado a seguinte função.


### -----SomaNumeros.jsx-----
```js
export default props => <h1>O resultado da soma é {props.num1 + props.num2}!</h1>
```


#### Ao importar é recomendado colocar um nome semelhante para identificação do componente


### -----index.js-----
```js
import SomaNum from './components/SomaNumeros'
//numeros ou outros argumentos que não são strings são usados entre chaves

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <SomaNum num1={1} num2={3} />
);

```


__________________________________

#### Para passar mais de uma tag, use uma div para enlaçar as tags ou use a tag ```<React.Fragment></React.Fragment>``` (diferente da div ela não gera nada, sua função é apenas unir as tags

```js
export default props => 
	<div>
		<h1>O resultado da soma é {props.num1 + props.num2}!</h1>
		<h1>O resultado da multiplicação é {props.num1 * props.num2}!</h1>
	</div>
```

#### Caso não queira escrever <React.Fragment> importe dessa forma:
```js
import React, {Fragment} from 'react'
```

#### Assim é possível utilizar

```js
<Fragment></Fragment>
```


#### Ainda é possível utilizar array, porém é necessario delcarar uma chave (key), pois sem ela o react perde performance ao procurar os elementos:

```js
export default props => 
	[
		<h1 key='tag1'>O resultado da soma é {props.num1 + props.num2}!</h1>,
		<h1 key='tag2'>O resultado da multiplicação é {props.num1 * props.num2}!</h1>
	]
```

### Nota: O recomendado é Div ou Fragment


# MULTIPLOS COMPONENTES 



#### É possível exportar mais de um componente além de exportar declarando como const, let e var


### -----MultiComponent.jsx-----
```js
import React from 'react'

export const Soma = props => {
	let result = 0;
	for (let x of props.numeros){
		result += x;
	}
	return <h1>Resultado da soma é {result}!</h1>
}

export const Multiplica = props => {
	let result = 1;
	for (let x of props.numeros){
		result *= x;
	}
	return <h1>Resultado da soma é {result}!</h1>
}
```




#### Ao declarar components como var, let ou const, é necessário utilizar o operador de desestruturação {MeuComponente1, MeuComponente2}

### -----index.js-----

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import {Soma, Multiplica} from './components/MultiComponent'

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div>
		<Soma numeros={[1,3,4,9]}/>
		<Multiplica numeros={[1,3,4,3]}/>
	</div>
);
```

______________________________

#### Ainda é possível exportar como default e tirar a necessidade do destructor

```js
export const Multiplica = props => {
	let result = 1;
	for (let x of props.numeros){
		result *= x;
	}
	return <h1>Resultado da soma é {result}!</h1>
}

export default Multiplica
```


#### Ao importar...

```js
import Multiplica, {Soma} from './components/MultiComponent'
```


______________________________________

#### Ainda há outra forma de importar, no caso a mais usada, e organizada, é exportando todos os componetes com default:

```js
export default {Multiplica, Soma}
```


#### Ao importar e utilizar...

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Multi from './components/MultiComponent'


const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div>
		<Multi.Soma numeros={[1,3,4,9]}/>
		<Multi.Multiplica numeros={[1,3,4,3]}/>
	</div>
);
```

### Nota: Essa forma diminui a chance de haver problema ao usar, funções e componentes com mesmo nome



# USESTATE 


#### O useState é utilizado para criar variaveis que podem ser modificadas, e apresentadas na pagina, em sua declaração é usada duas variaveis, uma que é a propria e outra para armazenar a função que vai modificar o estado/valor da primeira.

### Exemplo de declaração: 


#### Neste exemplo foi criada um componente que apresenta a hora atual, foi utilizada a função setInterval para atualizar o relogio a cada segundo, foi colocado o IF para evitar o bug de tentar setar o valor antes da variavel ser inicializada. Além disso foi colocado outros exemplos de declaração.


### ----------------MeuComponente.jsx--------------
```js
import React, {useState} from 'react'

function getDateAndFormat (setState){
	let date_now = new Date().toLocaleString()


	setState(date_now)

}

function setTextoInput(e,setTexto){
	setTexto(e.target.value)
}



export default props => {

	//É possível utilizar diversos tipo de variaveis, porém algumas tem seus problemas
	const [dataAtual,setData] = useState("valor inicializador")
	const [meuObjeto,setDados] = useState({"numeroPar":"","numeroImpar":""})
	const [meuTexto,setTexto] = useState("")
	//Esperando Variavel Iniciar
	if (dataAtual != undefined){
		/*passando a função setData que modifica o valor de dataAtual
		como argumento de função*/
		setInterval(()=>getDateAndFormat(setData), 1000)
		setInterval(()=>{
			setDados({"numeroPar":[0,2,4,6,8],"numeroImpar":[1,3,5,7,9]})
		}, 2000)
	}

	return <div>
	<div id='dataAtual'>{dataAtual}</div>
	<div id='numeroPar'>{meuObjeto.numeroPar}</div>
	<div id='numeroPar'>{meuObjeto.numeroImpar}</div>
	<input id="meuTexto" type="text" placeholder="Nome" onChange={(e)=>setTextoInput(e,setTexto)}/>
	<p>Texto Digitado: {meuTexto}</p>
	</div>
}
```




#### Neste exemplo é apresentado também, como lidar com eventos, nesse caso foi usado o evento onChange do input, os eventos tem que ser escritos com a segunda palavra com a letra inicial maiscula






### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import MeuComponente from './components/MeuComponente'


const root = ReactDOM.createRoot(document.getElementById('root'))


root.render(

	<MeuComponente />
);

```





# CLASSES COMPONENTS 


#### Para esse modulo é necessário importar o modulo Component


### ----------------ClasseComp.jsx--------------

```js
import React, {Component} from 'react'


export default class Animal extends Component {
	//para classe primeiramente ele não te acesso ao props
	// para acessa-lo é usado this.props
	render(){ //função responsavel por renderizar o componente
		const {nome, tipo} = this.props;

		return (
			<div>
				<h1>Nome: {nome} <br /> Tipo: {tipo}</h1>
				<hr />
				<input type="text" placeholder="Nome" value={nome}/>
				<input type="text" placeholder="Tipo" value={tipo}/>
			</div>
			)
	}
}
```

### Nota: vale mencionar que não é possível alterar o valor do  props, exemplo:
```js
this.props.atributo = 'valor' //isso dá erro, pois props serve para leitura
```

#### Uma forma de contornar isso está no proximo exemplo...

#### Importando...

### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import ClassComp from './components/ClasseComp'

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <ClassComp nome='Gato' tipo='mamifero'/>
);
```







## Mudando valor 

### ----------------ClasseComp.jsx--------------
```js
import React, {Component} from 'react'


export default class Animal extends Component {

	state = { //O state é usado para possibilitar a alteração de atributos
		tipo : this.props.tipo,
		nome : this.props.nome
	}

	setName(e){ 
		this.setState({ nome : e.target.value}) //função para alterar o estado podendo passar um ou mais atributos que quer alterar
	}

	setTipo(e){ 
		this.setState({ tipo : e.target.value}) 
	}


	render(){ 
		const {nome, tipo} = this.state;

		//para alterar é preciso colocar eventos
		return (
			<div>
				<h1>Nome: {nome} <br /> Tipo: {tipo}</h1>
				<hr />
				<input type="text" placeholder="Nome" value={nome} onChange={e => this.setName(e)}/>
				<input type="text" placeholder="Tipo" value={tipo} onChange={e => this.setTipo(e)}/>
			</div>
			)
	}
}
```


#### Importando e executando

### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import ClassComp from './components/ClasseComp'

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <ClassComp nome='Gato' tipo='mamifero'/>
);

```









_____________________________________

#### Ao chamar a função no evento da tag, o this pode variar, logo é usado uma arrow function, para corrigir o problema. No entanto, é possível usar um contructor para chamar a função sem usar arrow function:


### ----------------ClasseComp.jsx--------------
```js
import React, {Component} from 'react'


export default class Animal extends Component {

	state = { 
		tipo : this.props.tipo,
		nome : this.props.nome
	}

	constructor(props){ //constructor da classe
		super(props);
		this.setName = this.setName.bind(this); //uma forma de referenciar as funções e não  ter problema com o this
		this.setTipo = this.setTipo.bind(this);

	}

	setName(e){ 
		this.setState({ nome : e.target.value});
	}

	setTipo(e){ 
		this.setState({ tipo : e.target.value}); 
	}

	render(){ 
		const {nome, tipo} = this.state;

		//referenciando sem arrow function
		return (
			<div>
				<h1>Nome: {nome} <br /> Tipo: {tipo}</h1>
				<hr />
				<input type="text" placeholder="Nome" value={nome} onChange={this.setName}/>
				<input type="text" placeholder="Tipo" value={tipo} onChange={this.setTipo}/>
			</div>
			)
	}
}
```

#### Importanto...

### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import ClassComp from './components/ClasseComp'


const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <ClassComp nome='Gato' tipo='mamifero'/>
);

```




# CONTENÇÃO 



#### Para rederizar um componente dentro de outro é preciso colocar props.children dentro do componente pai

### ------Filho.jsx------

```js
import React from 'react'


export const Mamifero = props => { //criando filho
	return <React.Fragment>
		<h2>Nome: {props.nome} &nbsp;&nbsp;Tipo: {props.tipo} &nbsp;&nbsp;Vivo: {props.vivo}</h2>
	</React.Fragment>
}

export default {Mamifero}
```


### ------Pai.jsx------
```js
import React from 'react'
import Filho from './Filho'


export const Animal = props => {

	return <React.Fragment>
		<h1>PAI 
				<br />Nome: {props.nome} 
				<br />Tipo: {props.tipo}  
				<br />Vivo: {props.vivo}</h1>
		<hr />
		<h1>FILHOS</h1>
		{props.children}
	</React.Fragment>
}


export default {Animal}
```




### ----------------index.js--------------

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Pai, {Animal} from './components/Pai'
import Filho, {Mamifero} from './components/Filho'

const root = ReactDOM.createRoot(document.getElementById('root'))

root.render(

	<Animal nome ='Nome Animal' tipo='indeterminado' vivo = "nao">
		<Mamifero nome='Gato' tipo='mamifero' vivo = 'Sim' /> 
		<Mamifero nome='Cachorro' vivo = 'Sim' />
		<Mamifero /> 
		<Mamifero nome='Cavalo'/> 
	</Animal>

	)

```




# HERDANDO COMPONENTS 


#### Em React é possível criar componentes, com base em outros, apenas herdando um trecho, abaixo a criação e funcionamento:

### ------------------Componente Filho----------------

```js
import React from 'react'


export const Mamifero = props => { //criando filho
	return <React.Fragment>
		<h2>Nome: {props.nome} &nbsp;&nbsp;Tipo: {props.tipo} &nbsp;&nbsp;Vivo: {props.vivo}</h2>
	</React.Fragment>
}

export default {Mamifero}
```

### ----------------Componente Pai------------------
```js
import React from 'react'
import Filho from './Filho'


export const Animal = props => {
	
	// Abaixo a ordem dos filhos mostram:
	// 1- colocando o filho completo
	// 2- inserindo algumas propriedades do pai
	// 3- inserindo todas propriedades do pai
	// 4- inserindo todas propriedades do pai e alterando algumas
	
	return <React.Fragment>
		<h1>PAI 
				<br />Nome: {props.nome} 
				<br />Tipo: {props.tipo}  
				<br />Vivo: {props.vivo}</h1>
		<hr />
		<h1>FILHOS</h1>
		<Filho.Mamifero nome='Gato' tipo='mamifero' vivo = 'Sim' /> 
		<Filho.Mamifero nome='Cachorro' tipo= {props.tipo} vivo = 'Sim' />
		<Filho.Mamifero {...props} /> 
		<Filho.Mamifero {...props} nome='Cavalo'/> 
	</React.Fragment>
}


export default {Animal}
```

### ----------Importando para o index e executando---------------

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Pai from './components/Pai'

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <Pai.Animal nome ='Nome Animal' tipo='indeterminado' vivo = "nao" />
);

```




_______________________________

#### Para renderizar os filhos no arquivo index e quer herdar os componentes do pai, é preciso identificar no pai que ele recebe outros componentes: <br>Tomando como base que o arquivo Filho.jsx é o mesmo, segue os outros arquivos:



### ------Pai.jsx------
```js
import React from 'react'
import Filho from './Filho'

export const Animal = props => {
	// No pai é preciso usar a função
	// React.cloneElement em que clona um elemento
	// e adciona a possibilidade de adcionar novas
	// propriedas para ele:
	// Como a função funciona apenas para um elemento,
	// foi usado o map em cima dos filhos (React.Children),
	// e para cada children foi feita a mudança de propriedades.
	// React.cloneElement('elemento a ser clonado', {'novas propriedades'})
	return <React.Fragment>
		<h1>PAI 
				<br />Nome: {props.nome} 
				<br />Tipo: {props.tipo}  
				<br />Vivo: {props.vivo}</h1>
		<hr />
		<h1>FILHOS</h1>
		{
			React.Children.map(props.children, child =>{
				return React.cloneElement(child, {
				...props, ...child.props})
			})
			
		}
	</React.Fragment>
}
```



### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Pai, {Animal} from './components/Pai'
import Filho, {Mamifero} from './components/Filho'

const root = ReactDOM.createRoot(document.getElementById('root'))

root.render(

	<Animal nome ='Nome Animal' tipo='indeterminado' vivo = "nao">
		<Mamifero nome='Gato' tipo='mamifero' vivo = 'Sim' /> 
		<Mamifero nome='Cachorro' vivo = 'Sim' />
		<Mamifero /> 
		<Mamifero nome='Cavalo'/> 
	</Animal>

	)

```



# USEEFFECT 



#### UseEffect é chamado sempre que a pagina é atualizada/carregada, excelente para utilizar para criar e executar funções, assim que a pagina é atualizada, além disso tira a necessidade do if verificando se a variavel é inicializada (exemplo no MODULO USESTATE)

### ------------------Componente----------------
```js
import React, {useEffect,useState} from 'react'

export default props => {

	const [contaAtualiza,setconta] = useState(0)
	/*repare que a cada atalização na variavel contaAtualiza,
	a pagina é atualizada*/
	useEffect(
		() => {console.log("a pagina foi atualizada")}
		)

	return <div>
	<p>Meu Contador: {contaAtualiza}</p>
	<button onClick={()=>setconta(contaAtualiza+1)}>Set Contagem</button>
	</div>
}

```

### ----------------index.js--------------
```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Clock from './components/Pai'



const root = ReactDOM.createRoot(document.getElementById('root'))


root.render(

	<Clock />
);
```

### Não esqueça, que useEffect só é chamado, quando a pagina é totalmente carregada, ou seja ele tem um delay	






# VARIAVEIS GLOBAIS 



#### Pode Haver necessidade de passar um mesmo valor entre varios, arquivos e uma das formas de fazer isso é utilizando variaveis globais, vale mencionar, que as variaveis podem ser alteradas porém não são renderizadas como as que utilizam useState, elas são semelhantes ao 'props', porém há formas de contornar isso



### ----------------Primeiro.jsx--------------
```js
import React from 'react'

export default class VarGlobais{
	static elemento = 'fogo'
	static meuNum = 0

}

```
### ----------------Comp1.jsx--------------
```js
import React from 'react'
import Global from './Primeiro'

export default props => {

		return <div>
			<h1>Componente Filho</h1>
			<h2>{Global.elemento}</h2>
			<h2>{Global.meuNum}</h2>
			</div>

}
```

### ----------------Comp2.jsx--------------
```js
import React, {useState} from 'react'
import Comp1 from './Comp1'
import Global from './Primeiro'
export default props => {
	const [alteraGlobal, setAltera] = useState(Global.meuNum)
	return <div>
		<Comp1 />
		<hr/>
		<h1>Componente Pai</h1>
		<h2>{Global.elemento}</h2>
		<h2>{Global.meuNum}</h2>
		<button onClick={()=>{Global.meuNum+=1; setAltera(Global.meuNum)}}>Set Valor novo</button>
		</div>
}
```




### ----------------index.js--------------

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Comp2 from './components/Comp2'

const root = ReactDOM.createRoot(document.getElementById('root'))



root.render(

	<Comp2/>
);


```



# MUDANDO PAGINAS 


#### Neste modulo sera mostrado como mudar de pagina, basicamente a troca sera dada por condições, onde vai ser renderizado ou não um componente, e poderá ser colocada a url, ao realizar isso é possível ir e voltar entre paginas, armazenando historico




### ----------------Comp1.jsx--------------
```js
import React from 'react'

export default props => {
	return <div>
		<h1>{props.nomePagina}</h1>
		<h2>{props.conteudo}</h2>
		</div>
}

```



### ----------------Comp2.jsx--------------


```js
import React, {useState, useEffect} from 'react'
import Comp1 from './Comp1'


function showPage(setState, paginas, pag){
	
	//Parametro Self é usado para não criar uma nova aba
	const url = window.location.href.split("?") //pegando url atual

	if (pag === url[1]){
		setState(paginas[pag])// setando pagina a ser mostrada
	}
	else if (pag === 'MinhaPagina1'){
		window.open(url[0]+"?MinhaPagina1",'_self') //setando URL
	}else if (pag === 'MinhaPagina2'){
		window.open(url[0]+"?MinhaPagina2",'_self') 
	}
	
}


export default props => {
	
	//armazenando paginas que podem ser mostradas
	const paginas = {"MinhaPagina1":<Comp1 nomePagina="Primeira Pagina" conteudo="meu conteudo"/>,
						"MinhaPagina2":<Comp1 nomePagina="Segunda Pagina" conteudo="meu conteudo pag2"/>}
	const [paginaAtual, setPagina] = useState("")

	useEffect(
		()=>{
			const url = window.location.href
			const res = url.split("?")
			showPage(setPagina,paginas, res[1]) //setando pagina atual
		}
	)
	return <div>
		
		{paginaAtual}
		<button onClick={()=>showPage(setPagina,paginas,"MinhaPagina1")}>MinhaPagina1</button>
		<button onClick={()=>showPage(setPagina,paginas,"MinhaPagina2")}>MinhaPagina2</button>
		</div>
}

```



### ----------------index.js--------------

```js
import React from 'react'
import ReactDOM from 'react-dom/client'
import Comp2 from './components/Comp2'

const root = ReactDOM.createRoot(document.getElementById('root'))



root.render(

	<Comp2/>
);

```





#                                                          REFERENCIAS


https://www.udemy.com/course/curso-web/


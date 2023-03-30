# Java

## INDICE 

- **[Introdução](#introdução)**
- **[Leitura de Dados](#leitura-de-dados)**
- **[Condições e Loops](#condições-e-loops)**
- **[Arrays e Matrizes](#arrays-e-matrizes)**
- **[Strings](#strings)**
- **[Classes e Metodos](#classes-e-metodos)**
- **[Classe Herança](#classe-heranca)**
- **[Interface](#interface)**
- **[Polimorfismo - Override and Overload](#polimorfismo---override-and-overload)**
- **[Passagem por referência](#passagem-por-referência)**
- **[ArrayList](#arraylist)**
- **[Try And Catch](#tryandcatch)**






# INTRODUÇÃO 


#### Java é uma linguagem amplamente usada, e semelhante ao c e c++ ela é fortemente tipada, caso tenha estudado os mecionados, será facilitada a compreensão da linguagem Java<br>**Nota: Jamais esqueça do ponto e vírgula =)**

<br><br>
<hr/>


## PRIMEIRO PROGRAMA

#### Todo programa em Java é baseado em classe, como primeiro programa é preciso criar um arquivo tendo em mente que o nome dele tem que ser o mesmo que a classe, ou seja, vamos criar um arquivo chamado helloWorld.java<br>Dentro do arquivo:

```java
public class helloWorld{
  /*criando o metodo principal da classe a ser executado
  publico - modificador de acesso
  estatico - pode ser acessado sem instanciar , ou seja,
  em vez de InstanciaDeClasse.funcao(), pode se usar Classe.funcao()
  void - retorno vazio
  main - nome do metodo
  Neste exemplo recebeu um array de strings*/
  public static void main(String[] args){
    //println -> não quebra a linha
    System.out.print("Hello World!");
    //println -> quebra a linha
    System.out.println("Imprimindo outro texto!");
  }
}
```

#### Para executar basta colocar 
```cmd
javac helloWorld.java -> para compilar
java helloWorld -> para executar
```



## DECLARANDO E IMPRIMINDO VARIAVEIS
```java
public class helloWorld{
  
  public static void main(String[] args){
    int num;
      String hello;
      final int CONSTANTE = 50;
        hello = "Palavra";
      num = 50;
    /*
      Use printf para imprimir variaveis, basta
      usar antes da virgula o caractere especial referente
      ao tipo da variavel
    */
    System.out.printf("%s\n","Imprimindo Variavel!");
        System.out.printf("%s\n",hello);
      System.out.printf("%d\n",num);
      System.out.println("Numero " + num + "\n");
      System.out.printf("%d\n%d\n%d\n%d",3,4,5,6);
  }
  
}

```

<br><br>
<hr/>


# LEITURA DE DADOS 

```java
import java.util.Scanner; //pacote para leitura de dados

public class helloWorld{
  
  public static void main(String[] args){

      //Declaração e instanciação do objeto scanner
      Scanner scan = new Scanner(System.in);
      int num;
      /*
        next -> captura string
        nextLine -> captura string
        nextInt -> captura int
      */
      System.out.println("Insira um numero");
      num = scan.nextInt();
      System.out.println("Numero: " + num);

  }
}
```


# CONDIÇÕES E LOOPS 

```java
public class helloWorld{
  
  public static void main(String[] args){
      int num;
      num = 50;
      int x = 2;
      String resultado = "";
      if (num < 50){
        System.out.println("Numero menor que 50\n");
      }else if (num == 50){
        System.out.println("Numero igual a 50\n");
      }else{
        System.out.println("Numero maior a 50\n");
      }
	
      // É possível criar condições em uma unica linha, basta colocar 
      //"condicao" ? "retorno se verdadeiro" : "retorno se falso"
      resultado = (num == 0 ? "num é par" : "num é impar");
      System.out.printf("Resultado: %s\n",resultado);
    
      switch(x){
        case 1:
          System.out.println("Case 1\n");
          break; //entrou no case, não precisa verificar os outros
        case 2:
          System.out.println("Case 2\n");
          break;
        default:
          System.out.println("Case padrão\n");
          break; 
          
      }


      for(int cont = 0; cont < 4;cont++){
     	 if (cont == 3){
          /* Este comando, faz com que todo o codigo abaixo dentro do loop,
          não seja executado, e volte a ser executado após essa contagem, ele funciona 
          como o break porém ele não interrompe todo o loop, apenas prossegue para o proximo loop*/
          continue; 
        }
        System.out.printf("%d\n",cont);
      }

      int cont = 3;
      while(cont < 6){
        System.out.printf("Novo cont %d\n",cont);
        cont += 1;
      }
      
  }
  
}
```

<br><br>
<hr/>



# ARRAYS E MATRIZES 



## Criando e percorrendo arrays

```java
public class helloWorld{
  
  public static void main(String[] args){

    int[] nums = new int[6];//instaciando uma nova variavel

    int[] varios = {5,2,3,4};//recebendo uma cadeia de valores
    
    nums[1] = 1;
    nums[3] = 5;
    nums[5] = 10;
    for(int cont = 0; cont < 4;cont++){
      System.out.printf("%d - %d\n",nums[cont],varios[cont]);
    }

    //Uma forma mais facil de impressão e percorrer arrays
    nums[0] = 4;
    nums[2] = 3;
    nums[4] = 9;
    for (int x:nums){ //tipo variavel:array
      System.out.println("Novo valor: "+(x*2));
    }
  }
}
```



## Metodos de array

```java
import java.util.Arrays; //Importe a biblioteca para utilizar as funções
public class helloWorld{
  
  public static void main(String[] args){

    int[] varios = {5,2,3,4};
    
    // ORDENANDO ARRAY
    Arrays.sort(varios);
    //2,3,4,5


    //PREENCHENDO ARRAY
    int[] numbers = new int[4];

    Arrays.fill(numbers,33);
    //33,33,33,33

    //COPIANDO ARRAY
    //(origem,inicioOrigem,destino,inicioDestino,quantidade)
    System.arraycopy(varios,0,numbers,1,3);
    /*
      numbers -> 33,2,3,4
    */


    //COMPARANDO ARRAYS
    System.out.println(Arrays.equals(varios,numbers));
    //false



    /*Buscando elementos
    (array,elemento)
    Nota: è preciso ordenar o array primeiro. Use
    Arrays.sort
    Se o retorno for menor que 0 o item não está no array
    */
    System.out.println(Arrays.binarySearch(numbers,2));
    //Elemento na posição -> 1
  }
}

```

## Matrizes

```java
import java.util.Arrays; //Importe a biblioteca para utilizar as funções
public class helloWorld{
  
  public static void main(String[] args){

    //criado uma matriz
    int[][] matriz = new int[2][3];
    int[][] matriz2 = {{5,2,3,4},{1,1,2,3}};
    
    for (int x = 0; x<2; x++){
      Arrays.fill(matriz[x],x+5);
    }

    for (int[] x: matriz){
      System.out.println("Array");
      for (int y: x){
        System.out.println(y);
      }
    }
    
    System.out.println("\nMatriz 2");
    for (int[] x: matriz2){
      System.out.println("Outro Array");
      for (int y: x){
        System.out.println(y);
      }
    }
    
  }
}
```



<br><br>
<hr/>


# STRINGS
#### Neste modulo será apresentado alguns metodos para Strings e funções da biblioteca java.lang

```java
package Testes;

public class StringMetods {

	public static void main(String[] args) {
		String text = "\n   Esta e uma string de teste, sera utilizada para alguns testes de metodos   ";
		//Pegar a letra em determinada posição
		System.out.println("String em determinada posicão: "+text.charAt(3));
		
		//Tamanho da String
		System.out.println("Tamanho da String: "+text.length());
		
		//Retirando espaços a esquerda e direita
		System.out.println("Sem espaços: "+text.trim());
		text = text.trim();
		
		//Maiusculo e Minusculo
		System.out.println("Maiusculo: "+text.toUpperCase());
		System.out.println("Minusculo: "+text.toLowerCase());
		
		
		//Contem alguma letra, palavra ou trecho de frase
		System.out.println("Contem \"string de teste\": "+text.contains("string de teste"));
		System.out.println("Contem \"palavra\": "+text.contains("palavra"));
		
		
		//Substituir letra, palavra ou trecho de frase por outra
		//Nota.: no exemplo abaixo, pode-se verificar que ele substitui até alguns casos 
		//que podem não ser desejados
		System.out.println("Substitui: "+text.replace("teste","NOVO TESTE"));
		//para corrigir isso
		System.out.println("Correcao substitui: "+text.replace("teste,","NOVO TESTE"));
		
		
		//Comparacao de Strings
		System.out.println("E igual? "+text.equals("Uma outra String"));
		
		//Comparacao de Strings ignorando maiusculo ou minusculo
		System.out.println("E igual? "+text.equalsIgnoreCase("Esta e uma STRING de TESTE, sera UtiLiZadA para alguns testes de metodos"));
		
		
		//Dividindo String
		System.out.println("Parte da string de 21 a 26: "+text.substring(21,26));
	}
}
```

#### Além dos metodos normais de uma string, há também a classe STRING BUILDER

```java
package Testes;

public class StringMetods {

	public static void main(String[] args) {
		StringBuilder text = new StringBuilder("string de teste");
		
		//Adicionando frase à string no final
		text.append(" simples");
		System.out.println(text);
		
		//Adicionando frase à string em posição especifica
		text.insert(0,"Uma ");
		System.out.println(text);
				
	
		//revertendo String
		text.reverse();
		System.out.println(text);
		text.reverse();
		
		//convertendo para tipo String
		String text2 = text.toString();
		
		//Convertendo string em array
		//Neste metodo, é necessario colocar o separador
		//que vai servir para dividir a string e retorna um array
		System.out.println(text2.split(" ")[0]);
	}
}
```

### Ainda há diversos outros metodos, neste modulo foi colocado alguns dos mais usados

<br><br>
<hr/>

# CLASSES E METODOS 


#### Neste exemplo, vamos criar uma classe chamada ContaBancaria com alguns metodos e atributos e vamos importar para o arquivo principal, assim como criar uma classe e setar os atributos<br>**Nota:**<br>Public -> qualquer classe pode acessar<br>Protected -> apenas subclasses podem acessar<br>Private -> restrito a apenas a classe





### Arquivo ContaBancaria

```java
package aula; //Nome do pacote atual

public class ContaBancaria { //Classe publica (visivel para todos os outros arquivos)
  
  /*------------ Criando variaveis -------------*/
  String cliente;
  int contaNum;
  double saldo;
  
  /*----- Criando Variaveis Privadas -------*/
    private String extrato;
    
  /*--------- Criando metodos ------------*/

  
  /* Constructor de classe, para inicializar as variaveis
   * public ContaBancaria(String cliente, int contaNum, double saldo) {
    this.cliente = cliente;
    this.contaNum = contaNum;
    this.saldo = saldo;
  }*/
  
  
  /*---- Para variaveis privadas -------*/
  
   public void setExtrato(String val){
        this.extrato = val;
    }
    
    
  public void registraExtrato(double val){
    if (val > 0){
      this.extrato += "Conta "+this.contaNum+" - C - "+this.saldo+"\n";
    }else{
      this.extrato += "Conta "+this.contaNum+" - D - "+this.saldo+"\n";
    }
  }
  
  public String consultaExtrato(){
      return this.extrato;
    }

  public double consultarSaldo(){ //metodo publico (visivel para todos os outros arquivos)
    return this.saldo;
  }
  
  public void depositar(double val){
    this.saldo = this.saldo + val;
    this.registraExtrato(val);
  }
  
  public void sacar(double val){
    this.saldo = this.saldo - val;
    this.registraExtrato(-val);
  }
}

```



### Arquivo main
```java
package aula;
import aula.ContaBancaria;

public class main{ 
  
  public static void main(String[] args){
    
  /*Inicializando sem constructor*/
    ContaBancaria conta1 = new ContaBancaria();
    
    /*Inserindo valores nos atributos classe instanciada*/
    conta1.cliente = "rafa";
    conta1.contaNum = 36;
    conta1.saldo = 5000.00;
    
    
    /*Inicializando com constructor, não é necessario inserir os valores depois
     ContaBancaria conta1 = new ContaBancaria("rafa",36,500.00);
     */
    conta1.setExtrato("Extrato 2023\n------------\n");
    System.out.println("Cliente: " + conta1.cliente);
    System.out.println("Numero da conta " + conta1.contaNum);
    System.out.println("Saldo Atual: " + conta1.consultarSaldo());
    
    /*Chamando funções da classe instanciada*/
    conta1.depositar(20);
    conta1.sacar(100);
    conta1.sacar(1000);
    conta1.sacar(30);
    conta1.depositar(200);
    conta1.sacar(852);
    
    System.out.println(conta1.consultaExtrato());
  }

}

```








## Utilizando variaveis estaticas

#### Variaveis estaticas tem como funcionalidade, de serem variaveis como se fossem globais, mesmo que sejam instanciadas diversas vezes, o valor dela sera o mesmo para todas as instancias permanecendo a ultima alteração do valor. <br>Nota: essas variaveis tira a necessidade do 'this' visto que a variavel nunca será de uma só instancia, pois as variaveis possuem um unico endereço de memória




### Arquivo ContaBancaria

```java
package aula; 

public class ContaBancaria { 
  
  /*------------ Criando variaveis estaticas-------------*/
  /*Ao criar variaveis estaticas, elas podem ser acessadas sem 
   * inicializar/instanciar a classe*/
  static String cliente = "Padrao";
  static int contaNum = 1;
  static double saldo = 100.00;

  
  /* Constructor de classe, para inicializar as variaveis*/
   public ContaBancaria(String cliente_, int contaNum_, double saldo_) {
    cliente = cliente_;
    contaNum = contaNum_;
    saldo = saldo_;
  }
}

```



### Arquivo main
```java
package aula;
import aula.ContaBancaria;

public class main{ 
  
  public static void main(String[] args){
    
  /*Utilizando valores estaticos*/
    System.out.printf("Valores estaticos \nNome: %s\nConta: %d \nSaldo: %.2f\n--------------\n",ContaBancaria.cliente,ContaBancaria.contaNum,ContaBancaria.saldo);
    
    
    
    /*Inicializando com constructor, não é necessario inserir os valores depois*/
     ContaBancaria conta1 = new ContaBancaria("rafa",36,500.00);
     ContaBancaria conta2 = new ContaBancaria("Rod",2,600.00);
     
     //Imprimindo valores conta1
     System.out.printf("Valores estaticos \nNome: %s\nConta: %d \nSaldo: %.2f\n--------------\n",conta1.cliente,conta1.contaNum,conta1.saldo);
     //Ao instanciar uma classe mesmo ao receber novos valores, os atributos 
     //static, alteram em todas as intancias o valor
     System.out.printf("Valores estaticos \nNome: %s\nConta: %d \nSaldo: %.2f\n--------------\n",ContaBancaria.cliente,ContaBancaria.contaNum,ContaBancaria.saldo);

    
  }

  
}

```

<br><br>
<hr/>



# CLASSE HERANCA 




#### A herança em classes tem como importancia a facilidade assim como modularização de pre-definir alguns atributos, ao utilizar herança de classe é possivel um classe herdar todos os atributos e funcoes do pai.<br>Nota: a classe filho apenas herda atributos e metodos publicos ou protected




### Arquivo Animal
```java
package aula;

public class Animal {
	
	private String tipo = "Sem tipo"; 
	private String vivo = "Vivo";
    
    Animal(String tipo,String vivo){
        this.vivo = vivo;
        this.tipo = tipo;
    }
    
    protected void setTipo(String tipo) { //protected, pode ser acessado apenas pelos modulos internos
    	this.tipo = tipo;
    }
    protected void setVivo(String vivo) {
    	this.vivo = vivo;
    }
    
    protected String getTipo(){
    	return this.tipo;
    }
    
    protected String getVivo(){
    	return this.vivo;
    }
    
    
    protected String status(){ //limitando funcao a apenas os filhos
        return " encontra-se "+this.vivo;
    }
}

```



### Arquivo Mamifero
```java
package aula;
import aula.Animal;
public class Mamifero extends Animal{
	private String nome = "Nome Novo"; 
	private int patas = 0;
	
	Mamifero(String nome, int patas, String tipo, String vivo){
        /*em classe uma forma de inicializar/chamar o contrutor da classe, 
        é usando a palavra chave 'super' que funciona como o this
        porém para referenciar a classe Pai*/
        super(tipo,vivo); 
        this.nome = nome;
        this.patas = patas;
        System.out.println("Mamifero Criado");
        
    }
	
	protected void setNome(String nome) {
    	this.nome = nome;
    }
    protected void setPatas(int patas) {
    	this.patas = patas;
    }
    
    protected String getNome(){
    	return this.nome;
    }
    
    protected int getPatas(){
    	return this.patas;
    }

    protected String status(){
    	if (super.getVivo() == "Morto") {
    		/*Utilizando funcao do pai, poderia ser usada a variavel super.vivo
    		 * para verificar , se a variavel fosse protected
    		 */
    		return "O "+this.nome+" tipo " +super.getTipo()+super.status()+" =(\n\t Meus pesames pelo "+this.nome;
    	}
        return "O "+this.nome+" tipo " +this.getTipo()+super.status()+"\n"; //utilizando super para chamar o metodo do pai
    }
}
```



### Arquivo Main

```java
package aula;
import aula.Mamifero;

public class main{ 
  
	public static void main(String[] args){
		
	aula.Mamifero cachorro = new aula.Mamifero("Spike", 4, "cachorro", "Vivo");
	
	System.out.println(cachorro.status());
	cachorro.setVivo("Morto");
	System.out.println(cachorro.status());
	
	//É possível acessar a partir de uma instancia, as funções do pai
	System.out.println("\n"+cachorro.getTipo()); 
  }

  
}
```


<br><br>
<hr/>



# INTERFACE

#### Interfaces nada mais são que um documento onde fornece "instruções"/"asinatura de metodos" de como será criada a classe, ao criar uma classe recebendo uma interface como herança essa classe é obrigada a criar os metodos da interface. Além disso, é possível importar multiplas interfaces em uma classe, ao mesmo tempo que uma classe não pode receber por herança, multiplas classes.<br><br>Com base nisso, utilizaremos algumas classes e metodos de exemplos anteriores.


### Arquivo Disciplina
```java
package Interface;

//Use public interface -> para definir uma interface
public interface Disciplina { 
  
  /*Caso deseje definir alguma variavel, tenha certeza de
  dar um valor inicial, isso exclui a necessidade de 
  declarar variaveis na classe ao implementar a interface,
  lembrando que as variaveis não podem ser modificadas*/
  public String professor = "Sem Professor";
  public String sala = "A definir";
  public Boolean obrigatoria = true;
  

  //Definindo metodos de interface
  public void setNome(String nome);
  public void setProfessor(String professor);
  public void setDuracao(int duracao);
  public void setSala(String sala);
  public void setObrigatoria(Boolean obrigatoria);
  public String getAll();
  
}
```



### Arquivo Java
```java
package Interface;
import Interface.Disciplina;

public class Java implements Disciplina{ 
  private String nome;
  private String professor = Disciplina.professor; //recebendo valores definidos em disciplina
  private int duracaoMeses;
  private String sala = Disciplina.sala;
  private Boolean obrigatoria = Disciplina.obrigatoria;
  
  Java(String nome, int duracao){ //constructor basico
    this.nome = nome;
    this.duracaoMeses = duracao;
  }
  Java(String nome,String professor, int duracao,String sala, Boolean obrigatoria){ //constructor completo
  this.nome = nome;
    this.professor = professor;
    this.duracaoMeses = duracao;
    this.sala = sala;
    this.obrigatoria = obrigatoria;
  }

  public void setNome(String nome){
    this.nome = nome;
  }
  public void setProfessor(String professor){
    this.professor = professor;
  }
  public void setDuracao(int duracao){
    this.duracaoMeses = duracao;
  }
  public void setSala(String sala){
    this.sala = sala;
  }
  public void setObrigatoria(Boolean obrigatoria){
    this.obrigatoria = obrigatoria;
  }

  public String getAll() {
    return "DISCIPLINA \n---------\nNome: "+this.nome+
        "\nProfessor: "+this.professor+
        "\nDuracao: "+this.duracaoMeses+" meses"+
        "\nSala: "+this.sala+
        "\nObrigatoria: "+this.obrigatoria+
        "\n---------\n\n";
  }
}
```

### Arquivo main
```java
package Interface;
import Interface.Java;

public class Main{ 

  public static void main(String[] args){
    Java javaBasics = new Java("Java Basics I",5);
    System.out.println(javaBasics.getAll());
  }
}


/*
SAIDA
DISCIPLINA 
---------
Nome: Java Basics I
Professor: Sem Professor
Duracao: 5 meses
Sala: A definir
Obrigatoria: true
---------
*/
```


<br><br>
<hr/>


# POLIMORFISMO - OVERRIDE AND OVERLOAD
#### Os conceitos de overload e override se dão pela diferenciação de parametros e nome de metodos das classes, Exemplo:
#### Caso uma classe herdando a outra, queira ter uma metodos de mesmo nome mas com funções diferentes substituindo a função da superclasse, basta usar o metodo OVERRIDE para sobreescrever a função, logo ao chamar a função, o metodo que será considerado, será da subclasse
#### Caso uma classe deseja ter metodos com mesmos nomes, mas com funções diferentes, basta que elas tenham paramêtros diferentes, seja pela quantidade ou tipo dos mesmos, assim o java priorizará a função com aquela "assinatura" especifica

### Arquivo Forma2D
```java

public class Forma2D {
    protected float x;
    protected float y;
    
    public float calculaArea() {
        return this.x*this.y;
    }
}
```


### Arquivo Triangulo

```java

public class Triangulo extends Forma2D{

    @Override //Substituindo função da superclasse
    public float calculaArea() { //reescrevendo um metodo com mesmo nome, mas função diferente da superclasse
        return (x*y)/2;
    }
    
    public String mudaLados(int multiplicador) { //criando função com um parametro
        this.x *= multiplicador;
        this.y *= multiplicador;
        return "Lados Alterados: "+this.x+","+this.y;
    }
    

    //criando função com mesmo nome mas com um parametros diferentes
    public String mudaLados(float x, float y) {
        this.x = x;
        this.y = y;
        return "Lados Alterados: "+this.x+","+this.y;
    }
}
```

### Arquivo TesteArea

```java

public class TesteArea {

    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo();
        
        
        triangulo.x = 5;
        triangulo.y = 5;
        
        
        System.out.println("Area: "+triangulo.calculaArea());
        System.out.println(triangulo.mudaLados(2));
        System.out.println(triangulo.mudaLados(8,6));
        

        /*SAIDA
        
        Area: 12.5
        Lados Alterados: 10.0,10.0
        Lados Alterados: 8.0,6.0
        */
        

    }

}
```

<br><br>
<hr/>



# PASSAGEM POR REFERÊNCIA
#### Como é possível verificar, o Java não contém o conceito de ponteiros assim como C++, e a passagem de valores para uma função é limitada ao escopo. <br>Ex.:
```java
public class Main{ 
  
  public static void main(String[] args){
    int variavel = 0;
    soma1(variavel);
    System.out.println(variavel);
    /*
      SAIDA -> 0
    */
  }
  
  public soma1(int variavel){
    variavel += 1;
  }
}
```

#### Porém há uma forma de contornar isso, que é através de arrays, ao declarar um array, é possível passar a variavel por referência dentro da função, ligando o mesmo espaço de memória.


```java
public class Main{ 
  
  public static void main(String[] args){
    int variavel = 0;
    int []variavel2 = {0};
    soma1(variavel);

    System.out.println(variavel);
    /*
      SAIDA -> 0
    */
    soma1(variavel2);
    System.out.println(variavel2[0]);
    /*
      SAIDA -> 1
    */
  }
  
  public static void soma1(int variavel){
      variavel += 1;
    }

  /*Mesmo criando a funções de mesmos nomes, 
  elas tem assinaturas diferentes de acordo com seus parâmetros*/
  public static void soma1(int[] variavel){
        variavel[0] += 1;
    }
}
```

<br><br>
<hr/>


# ARRAYLIST
#### ArrayList é uma classe/objeto que funciona como um array, porém com métodos avançados tornando mais facil e pratico, uma das vantagens é criar um array dinamico, onde o tamanho pode variar facilmente, abaixo a criação e metodos:

## Criando arrays e apresentando metodos


```java

    import java.util.ArrayList; //importando arrayList
public class ArrayListExample {
    public class Main(){
        public static void main(){

            ArrayList<String> animais = new ArrayList<>();

            /* Caso queira criar com posições use
            ArrayList<String> animais = new ArrayList<>(100);
            */

            //Adicionando valores
            animais.add("galo");
            animais.add("cavalo");
            animais.add("gato");
            animais.add("cachorro");
            animais.add("peixe");

            /*Acessando elemento especifico
            dentro do get coloque o indice desejado
            */
            System.out.println(animais.get(0));


            /*dentro da função coloque o objeto desejado
            e como retorno é recebido o indice*/
            System.out.println(animais.indexOf("cachorro"));


            /*dentro da função coloque o objeto ou indice
            desejado e ele será apagado*/
            System.out.println(animais.remove("cavalo"));
            System.out.println(animais.get(1));//gato agora é indice 1


            //Tamanho do array
            System.out.println(animais.size());


            //Limpando posições inutilizadas do array
            animais.trimToSize();
            //Limpando array
            animais.clear();

          /*ERRO pois não há mais elementos
            System.out.println(animais.get(0));*/
        }
    }
```




# TryAndCatch
#### Assim como em praticamente todas as linguagens de programação, Java contém tratamento de erros. Ao dar erro em um programa esse tratamento possibilita que o programa não seja interrompido e continue executando de forma normal, neste modulo será apresentada todas as formas de tratamento:

#### Try -> tente fazer X<br>
#### Catch -> Se X der erro, execute meu codigo<br>
#### Finally -> Não importa X, execute meu codigo<br>
#### Trow -> Lance essa exceção na tela<br>

## Criando arrays e apresentando metodos


```java

    import java.util.ArrayList; //importando arrayList
    public class TryCatch(){
        public static void main(){

            ArrayList<String> animais = new ArrayList<>();

            animais.add("galo");
            animais.add("cavalo");
            animais.add("gato");


            try{
                System.out.println(animais.get(5));
            }catch(Exception e){
                System.out.println("ERRO DE INDICE");
                //Mostrando erro
                System.out.println(e.getMessage());
            }finally{
                System.out.println("FIM");
            }
            

            /*use trow.SUAEXCECAO e dentro a mensagem do erro para lança-lo
            para o Trow é comum usa-lo com alguma condição, normalmente
            um if onde ele iclui a exceção desejada*/
            throw new IllegalArgumentException("ERRO DE ARGUMENTO");
        }
    }
```

<br><br>
<hr />

# REFERENCIAS
[PLAYLIST JAVA CFB](https://www.youtube.com/watch?v=X8AnVQ-GqLU&list=PLx4x_zx8csUjFC5WWjoNUL7LOOD7LCKRW)






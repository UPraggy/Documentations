/*
INDICE 

# Java
- INTRODUÇÃO
- LEITURA DE DADOS
- CONDIÇÕES E LOOPS
- ARRAYS E MATRIZES
- CLASSES E METODOS
- CLASSE HERANCA

*/

/*Obs.: 

Para buscar pesquise por '# nome'.*/




/*                                      ########################################################### 
                                        ###########################################################
                                        ######################### INTRODUÇÃO ######################
                                        ###########################################################
                                        ###########################################################*/

/*
Java é uma linguagem amplamente usada, e 
semelhante ao c e c++ ela é fortemente tipada,
caso tenha estudado os mecionados, será
facilitada a compreensão da linguagem Java

Nota: Jamais esqueça do ponto e vírgula =)
*/
/*-------------------------PRIMEIRO PROGRAMA--------------------------

Todo programa em Java é baseado em classe,
Como primeiro programa é preciso criar um arquivo tendo em mente
que o nome dele tem que ser o mesmo que a classe,
ou seja, vamos criar um arquivo chamado helloWorld.java
Dentro do arquivo:
*/

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

/*
Para executar basta colocar 
javac helloWorld.java -> para compilar
java helloWorld -> para executar
*/



//-------------------------DECLARANDO E IMPRIMINDO VARIAVEIS--------------------------
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




/*                                      ########################################################### 
                                        ###########################################################
                                        ####################### LEITURA DE DADOS ##################
                                        ###########################################################
                                        ###########################################################*/

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



/*                                      ########################################################### 
                                        ###########################################################
                                        ###################### CONDIÇÕES E LOOPS ##################
                                        ###########################################################
                                        ###########################################################*/


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
        System.out.printf("%d\n",cont);
      }

      int cont = 3;
      while(cont < 6){
        System.out.printf("Novo cont %d\n",cont);
        cont += 1;
      }
      
  }
  
}






                               

/*                                      ########################################################### 
                                        ###########################################################
                                        #################### ARRAYS E MATRIZES ####################
                                        ###########################################################
                                        ###########################################################*/



//-------------------Criando e percorrendo arrays------------------

public class helloWorld{
  
  public static void main(String[] args){

    int[] nums = new int[6];

    int[] varios = {5,2,3,4};
    
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
    for (int x:nums){
      System.out.println("Novo valor: "+(x*2));
    }
  }
}




//-------------------Metodos de array------------------


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



/*-----------------------Matrizes-------------------*/

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



/*                                      ########################################################### 
                                        ###########################################################
                                        #################### CLASSES E METODOS ####################
                                        ###########################################################
                                        ###########################################################*/

/*
Neste exemplo, vamos criar uma classe chamada ContaBancaria com alguns metodos e atributos
e vamos importar para o arquivo principal, assim como criar uma classe e setar os atributos

Nota:
Public -> qualquer classe pode acessar
Protected -> apenas subclasses podem acessar
Private -> restrito a apenas a classe
*/




/*------------------Arquivo ContaBancaria-----------------*/
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





/*------------------Arquivo main-----------------*/
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










/*----------------------Utilizando variaveis estaticas-------------------------------*/
/*
Variaveis estaticas tem como funcionalidade,
de serem variaveis como se fossem globais,
mesmo que sejam instanciadas diversas vezes,
o valor dela sera o mesmo para todas as instancias
permanecendo a ultima alteração do valor

Nota: essas variaveis tira a necessidade do 'this' visto que 
a variavel nunca será de uma só instancia, pois as variaveis possuem um 
unico endereço de memória
*/



/*-----------------Arquivo ContaBancaria-----------------*/


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





/*-----------------Arquivo main-----------------*/
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







/*                                      ########################################################### 
                                        ###########################################################
                                        ####################### CLASSE HERANCA ####################
                                        ###########################################################
                                        ###########################################################*/



/*
A herança em classes tem como importancia a facilidade 
assim como modularização de pre-definir alguns atributos,
ao utilizar herança de classe é possivel um classe herdar 
todos os atributos e funcoes do pai

Nota: a classe filho apenas herda atributos e metodos
publicos ou protected
*/



/*-----------------Arquivo Animal-----------------*/

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





/*-----------------Arquivo Mamifero-----------------*/

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




/*-----------------Arquivo Main-----------------*/

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


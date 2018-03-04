package Analizador_CJS;
import java_cup.runtime.*;
import java.util.ArrayList;

%%
%{
public String colector_cadena = "";
public String comentario = "";
//public ArrayList<Nodo_Error> Listado_Errores;  
%}

%public
%class ALexicoCJS
%cupsym SimbolosCJS
%cup    
%char
%column
%full
%line
%unicode
%ignorecase
/*------------------EXPRESIONES REGULARES--------------*/

digito = [0-9] //E.R. que reconoce el intervalo de dígitos del 0 al 9.
numero = {digito}+("." {digito}+)?//E.R. que reconoce tanto decimales como enteros.

Letra = [a-zA-Z] //E.R. que reconoce el intervalo de letras de la a hasta z minúsculas y mayúsculas.
identificador = {Letra}+({Letra}|{numero}|"_")*//E.R. para reconocer identificadores
//texto = [>](([ ]|\t|\r|\n|\f)*)([a-z]|[A-z])([^<]+) [<] | [>] (([ ]|\t|\r|\n|\f)*)([^<]+)[<]  
cadena_dos = "\""[^\"]*"\""






%state COMENTARIO
%state MULTI
%state STRING_CENTRO
%%

<YYINITIAL>{
 

 	"''"    {yybegin(COMENTARIO);}
    "'/'"    {yybegin(MULTI);}
    
    /*--------------------signos de relacion--------------------------------*/
    "=="     {System.out.println("igual"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.igual, yycolumn, yyline, yytext()); }
    "!="     {System.out.println("diferente"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.diferente, yycolumn, yyline, yytext()); }
    ">"     {System.out.println("mayor"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.mayor, yycolumn, yyline, yytext()); }
    "<"     {System.out.println("menor"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.menor, yycolumn, yyline, yytext()); }
    ">="     {System.out.println("mayor_igual"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.mayor_igual, yycolumn, yyline, yytext()); }
    "<="     {System.out.println("menor_igual"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.menor_igual, yycolumn, yyline, yytext()); }
    "&&"     {System.out.println("and"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_and, yycolumn, yyline, yytext()); }
    "||"     {System.out.println("or"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_or, yycolumn, yyline, yytext()); }
    "!"     {System.out.println("not"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_not, yycolumn, yyline, yytext()); }
    
    /*--------------------signos de agrupacion--------------------------------*/
    "{"     {System.out.println("llave_a"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.llave_a, yycolumn, yyline, yytext()); }
    "}"     {System.out.println("llave_c"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.llave_c, yycolumn, yyline, yytext());}
    "("     {System.out.println("par_abierto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_parA, yycolumn, yyline, yytext());}
    ")"     {System.out.println("par_cerrado"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_parC, yycolumn, yyline, yytext());}
    /*------------------------sigons de puntuacion y operadores----------------*/
    "."     {System.out.println("punto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.punto, yycolumn, yyline, yytext());}
    ";"     {System.out.println("p_coma"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.p_coma, yycolumn, yyline, yytext());}
    ":"     {System.out.println("dos_puntos"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.dos_puntos, yycolumn, yyline, yytext());}
    ","     {System.out.println("coma "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.coma, yycolumn, yyline, yytext());}

     "+"     {System.out.println("mas "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.mas, yycolumn, yyline, yytext());}
    "-"     {System.out.println("menos "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.menos, yycolumn, yyline, yytext());}
    "*"     {System.out.println("por "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.por, yycolumn, yyline, yytext());}
    "/"     {System.out.println("div "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.div, yycolumn, yyline, yytext());}
    "--"     {System.out.println("decremento "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.decremento, yycolumn, yyline, yytext());}
    "++"     {System.out.println("aumento "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.incremento, yycolumn, yyline, yytext());}


/*--------------------PALABRAS RESERVADAS---------------------------- */


    "SI"  {System.out.println("pr_si "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_si, yycolumn, yyline, yytext());}
    "SINO"  {System.out.println("pr_sino "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_sino, yycolumn, yyline, yytext());}
    "PARA"       {System.out.println("pr_para "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_para, yycolumn, yyline, yytext());}
    "MIENTRAS"       {System.out.println("pr_mientras "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_mientras, yycolumn, yyline, yytext());}
    "FUNCION"   {System.out.println("pr_funcion  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_funcion, yycolumn, yyline, yytext());}
    "IMPRIMIR"   {System.out.println("pr_imprimir  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_imprimir, yycolumn, yyline, yytext());}
    "DIMV"    {System.out.println("pr_dimv "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_dimv, yycolumn, yyline, yytext());}
    "RETORNAR"    {System.out.println("pr_retornar "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_retornar, yycolumn, yyline, yytext());}
    "DETENER"   {System.out.println("pr_detener"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_detener, yycolumn, yyline, yytext());}
    "DOCUMENTO"   {System.out.println("pr_documento"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.pr_documento, yycolumn, yyline, yytext());}
    "OBSERVADOR"        {System.out.println("pr_observador "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_observador, yycolumn, yyline, yytext());}
    "ATEXTO"        {System.out.println("pr_atexto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_atexto, yycolumn, yyline, yytext());}
    "SETELEMENTO"       {System.out.println("pr_setelemento "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_setelemento, yycolumn, yyline, yytext());}
    "SELECCIONA"       {System.out.println("pr_selecciona "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_selecciona, yycolumn, yyline, yytext());}
    "CASO"       {System.out.println("pr_caso "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_caso, yycolumn, yyline, yytext());}
    "DEFECTO"       {System.out.println("pr_defecto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_defecto, yycolumn, yyline, yytext());}
    "MENSAJE"  {System.out.println("pr_mensaje"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_mensaje, yycolumn, yyline, yytext());}
    "OBTENER"  {System.out.println("pr_obtener"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_obtener, yycolumn, yyline, yytext());}
    "CONTEO"       {System.out.println("pr_conteo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_conteo, yycolumn, yyline, yytext());}
    "\"TRUE\""       {System.out.println("pr_true "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_true, yycolumn, yyline, yytext().substring(1,yytext().lenght - 1));}
    "\"FALSE\""       {System.out.println("pr_false "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.pr_false, yycolumn, yyline, yytext().substring(1,yytext().lenght - 1));}
    
    {numero}        {System.out.println("numero "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCJS.numero, yycolumn, yyline, yytext());}
    {identificador} {System.out.println("id "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.identificador, yycolumn, yyline, yytext());}
    {cadena_dos} {System.out.println("cadena "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCJS.cadena, yycolumn, yyline, yytext());}
     
}


<MULTI>
{
    "/'"    {System.out.println("Comentario multi: "+comentario);
                comentario ="";
             yybegin(YYINITIAL);
            }
    .       { 
                comentario+= yytext();
            }
    [ \t\r\n\f] {}
}


<COMENTARIO>
{
    [^"\n"]     {comentario += yytext();}
    "\n"        {
                System.out.println("Comentario simple: "+comentario);
                comentario = "";
                yybegin(YYINITIAL);
                }
}

[ \t\r\n\f]     {}

.           {System.out.println("simbolo: <<"+yytext()+">> ["+yyline+" , "+yycolumn+"]");
            return new Symbol(SimbolosCJS.ptodo, yycolumn, yyline, yytext());
             //Listado_Errores.add(new Nodo_Error(yytext(),yycolumn,yyline,"Error Lexico","El caracter no pertenece al lenguaje"));   
            }
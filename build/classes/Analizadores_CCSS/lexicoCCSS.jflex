package Analizadores_CCSS;
import java_cup.runtime.*;
import java.util.ArrayList;

%%
%{
public String colector_cadena = "";
public String comentario = "";
//public ArrayList<Nodo_Error> Listado_Errores;  
%}


%public
%class ALexicoCCSS
%cupsym SimbolosCCSS
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
inicio = [>](([ ]|\t|\r|\n|\f)*)({otro_simb}|{numero}|([a-z]|[A-z]))
otro_simb = ["%"|"&"|"{"|"-"|"!"|"#"|"$"|"/"|"("|")"|"="|"?"|"¿"|"¡"|"°"|"¬"|"}"|"^"|"_"|"+"|"*"|":"|"."|","|";"]+  
//texto = [>](([ ]|\t|\r|\n|\f)*)([a-z]|[A-z])([^<]+) [<] | [>] (([ ]|\t|\r|\n|\f)*)([^<]+)[<]  
cadena_dos = "\""[^\"]*"\""






%state COMENTARIO
%state MULTI
%state STRING_CENTRO
%%

<YYINITIAL>{
 

 	"//"    {yybegin(COMENTARIO);}
    "/*"    {yybegin(MULTI);}
    
  
    "]"     {System.out.println("cor_a"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.cor_c, yycolumn, yyline, yytext()); }
    "["     {System.out.println("cor_c"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.cor_a, yycolumn, yyline, yytext());}
    "("     {System.out.println("par_abierto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_parA, yycolumn, yyline, yytext());}
    ")"     {System.out.println("par_cerrado"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_parC, yycolumn, yyline, yytext());}
     ","     {System.out.println("coma "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.coma, yycolumn, yyline, yytext());}
    ";"     {System.out.println("punto y coma "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.p_coma, yycolumn, yyline, yytext());}
    ":="     {System.out.println("asig"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.asig, yycolumn, yyline, yytext());}
    "*"     {System.out.println("por"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.por, yycolumn, yyline, yytext());}
    "/"     {System.out.println("div"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.div, yycolumn, yyline, yytext());}
    "-"     {System.out.println("menos"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.menos, yycolumn, yyline, yytext());}
    "+"     {System.out.println("mas"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.mas, yycolumn, yyline, yytext());}

/*--------------------PALABRAS RESERVADAS---------------------------- */


    "alineado"  {System.out.println("pr_alineado "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_alineado, yycolumn, yyline, yytext());}
    "texto"  {System.out.println("pr_texto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_texto, yycolumn, yyline, yytext());}
    "izquierda"       {System.out.println("pr_izquierda "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_izquierda, yycolumn, yyline, yytext());}
    "derecha"       {System.out.println("pr_derecha "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_derecha, yycolumn, yyline, yytext());}
    "centrado"   {System.out.println("pr_centrado  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_centrado, yycolumn, yyline, yytext());}
    "justificado"   {System.out.println("pr_justificado  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_justificado, yycolumn, yyline, yytext());}
    "formato"    {System.out.println("pr_formato "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_formato, yycolumn, yyline, yytext());}
    "negrilla"    {System.out.println("pr_negrilla "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_negrilla, yycolumn, yyline, yytext());}
    "true"   {System.out.println("pr_true"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_true, yycolumn, yyline, yytext());}
    "false"   {System.out.println("pr_false"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_false, yycolumn, yyline, yytext());}
    "cursiva"        {System.out.println("pr_cursiva "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_cursiva, yycolumn, yyline, yytext());}
    "mayuscula"        {System.out.println("pr_mayuscula "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_mayuscula, yycolumn, yyline, yytext());}
    "minuscula"       {System.out.println("pr_minuscula "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_minuscula, yycolumn, yyline, yytext());}
    "capital-t"       {System.out.println("pr_capital "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_capital, yycolumn, yyline, yytext());}
    "letra"       {System.out.println("pr_letra "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_letra, yycolumn, yyline, yytext());}
    "tamtex"       {System.out.println("pr_tamtext "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_tamtext, yycolumn, yyline, yytext());}
    "fondoelemento"  {System.out.println("pr_fondoelemento"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_fondoelemento, yycolumn, yyline, yytext());}
    "autoredimension"  {System.out.println("pr_autoredimension"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_autoredimension, yycolumn, yyline, yytext());}
    "visible"       {System.out.println("pr_visible "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_visible, yycolumn, yyline, yytext());}
    "borde"       {System.out.println("pr_borde "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_borde, yycolumn, yyline, yytext());}
    "opaque"   {System.out.println("pr_opaque  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_opaque, yycolumn, yyline, yytext());}
    "colortext"   {System.out.println("pr_colortext  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_colortext, yycolumn, yyline, yytext());}
    "grupo"    {System.out.println("pr_grupo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_grupo, yycolumn, yyline, yytext());}
    "id"    {System.out.println("pr_id "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.pr_id, yycolumn, yyline, yytext());}
    "horizontal"   {System.out.println("pr_horizontal "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_horizontal, yycolumn, yyline, yytext());}
    "vertical"   {System.out.println("pr_vertical "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.pr_vertical, yycolumn, yyline, yytext());}
    
    {numero}        {System.out.println("numero "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(SimbolosCCSS.numero, yycolumn, yyline, yytext());}
    {identificador} {System.out.println("id "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.identificador, yycolumn, yyline, yytext());}
    {cadena_dos} {System.out.println("cadena "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.cadena, yycolumn, yyline, yytext());}
   // {otro_simb} {System.out.println("simbolooo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.otro_simb, yycolumn, yyline, yytext());}
//    {texto} {System.out.println("texto prueba "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(SimbolosCCSS.texto, yycolumn, yyline, yytext());}
    
}


<MULTI>
{
    "*/"    {System.out.println("Comentario multi: "+comentario);
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
            return new Symbol(SimbolosCCSS.ptodo, yycolumn, yyline, yytext());
             //Listado_Errores.add(new Nodo_Error(yytext(),yycolumn,yyline,"Error Lexico","El caracter no pertenece al lenguaje"));   
            }
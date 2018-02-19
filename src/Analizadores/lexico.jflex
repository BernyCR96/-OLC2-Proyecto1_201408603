package Analizadores;
import java_cup.runtime.*;
import java.util.ArrayList;

%%
%{
public String colector_cadena = "";
public String comentario = "";
//public ArrayList<Nodo_Error> Listado_Errores;  
%}

%public
%class ALexico
%cupsym Simbolos
%cup    
%char
%column
%full
%line
%unicode
/*------------------EXPRESIONES REGULARES--------------*/

digito = [0-9] //E.R. que reconoce el intervalo de dígitos del 0 al 9.
numero = {digito}+("." {digito}+)?//E.R. que reconoce tanto decimales como enteros.

Letra = [a-zA-Z] //E.R. que reconoce el intervalo de letras de la a hasta z minúsculas y mayúsculas.
identificador = {Letra}+({Letra}|{numero}|"_")*//E.R. para reconocer identificadores
inicio = "--"
otro_simb = ["%"|"&"|"{"|"-"|"!"|"#"|"$"|"/"|"("|")"|"="|"?"|"¿"|"¡"|"°"|"¬"|"}"|"^"|"_"|"+"|"*"]  

cadena_dos = "\""[^\"]*"\""




%state COMENTARIO
%state MULTI
%state STRING_CENTRO
%%

<YYINITIAL>{
 

 	"//"    {yybegin(COMENTARIO);}
    "<//-"    {yybegin(MULTI);}
    {inicio}    {yybegin(STRING_CENTRO);}
    
  
    /*--------------------signos de agrupacion--------------------------------*/
    "<"     {System.out.println("menor"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.menor, yycolumn, yyline, yytext()); }
    ">"     {System.out.println("mayor"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.mayor, yycolumn, yyline, yytext());}
    "("     {System.out.println("par_abierto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_parA, yycolumn, yyline, yytext());}
    ")"     {System.out.println("par_cerrado"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_parC, yycolumn, yyline, yytext());}
    /*------------------------sigons de puntuacion y operadores----------------*/
     ","     {System.out.println("coma "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());}
    ";"     {System.out.println("punto y coma "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.p_coma, yycolumn, yyline, yytext());}
    "="     {System.out.println("igual"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.igual, yycolumn, yyline, yytext());}

/*--------------------PALABRAS RESERVADAS---------------------------- */


    "CHTML"  {System.out.println("pr_chtml "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_chtml, yycolumn, yyline, yytext());}
    "FIN-CHTML"  {System.out.println("pr_finchtml "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finchtml, yycolumn, yyline, yytext());}
    "ENCABEZADO"       {System.out.println("pr_encabezado "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_encabezado, yycolumn, yyline, yytext());}
    "FIN-ENCABEZADO"       {System.out.println("pr_finencabezado "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finencabezado, yycolumn, yyline, yytext());}
    "CJS"   {System.out.println("pr_cjs  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_cjs, yycolumn, yyline, yytext());}
    "FIN-CJS"   {System.out.println("pr_fincjs  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fincjs, yycolumn, yyline, yytext());}
    "CCSS"    {System.out.println("pr_ccss "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_ccss, yycolumn, yyline, yytext());}
    "FIN-CCSS"    {System.out.println("pr_finccss "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finccss, yycolumn, yyline, yytext());}
    "TITULO"   {System.out.println("pr_titulo"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_titulo, yycolumn, yyline, yytext());}
    "FIN-TITULO"   {System.out.println("pr_fintitulo"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_fintitulo, yycolumn, yyline, yytext());}
    "CUERPO"        {System.out.println("pr_cuerpo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_cuerpo, yycolumn, yyline, yytext());}
    "FIN-CUERPO"        {System.out.println("pr_fincuerpo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fincuerpo, yycolumn, yyline, yytext());}
    "PANEL"       {System.out.println("pr_panel "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_panel, yycolumn, yyline, yytext());}
    "FIN-PANEL"       {System.out.println("pr_finpanel "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finpanel, yycolumn, yyline, yytext());}
    "TEXTO"       {System.out.println("pr_texto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_texto, yycolumn, yyline, yytext());}
    "FIN-TEXTO"       {System.out.println("pr_fintexto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fintexto, yycolumn, yyline, yytext());}

    "CAJA_TEXTO"  {System.out.println("pr_caja_texto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_caja_texto, yycolumn, yyline, yytext());}
    "FIN-CAJA_TEXTO"  {System.out.println("pr_fincaja_texto"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fincaja_texto, yycolumn, yyline, yytext());}
    "IMAGEN"       {System.out.println("pr_imagen "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_imagen, yycolumn, yyline, yytext());}
    "FIN-IMAGEN"       {System.out.println("pr_finimagen "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finimagen, yycolumn, yyline, yytext());}
    "BOTON"   {System.out.println("pr_boton  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_boton, yycolumn, yyline, yytext());}
    "FIN-BOTON"   {System.out.println("pr_finboton  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finboton, yycolumn, yyline, yytext());}
    "ENLACE"    {System.out.println("pr_enlace "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_enlace, yycolumn, yyline, yytext());}
    "FIN-ENLACE"    {System.out.println("pr_finenlace "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finenlace, yycolumn, yyline, yytext());}
    "TABLA"   {System.out.println("pr_tabla "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_tabla, yycolumn, yyline, yytext());}
    "FIN-TABLA"   {System.out.println("pr_fintabla "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_fintabla, yycolumn, yyline, yytext());}
    "FIL_T"        {System.out.println("pr_fil_t "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fil_t, yycolumn, yyline, yytext());}
    "FIN-FIL_T"        {System.out.println("pr_finfil_t "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finfil_t, yycolumn, yyline, yytext());}
    "CB"       {System.out.println("pr_cb "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_cb, yycolumn, yyline, yytext());}
    "FIN-CB"       {System.out.println("pr_fincb "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fincb, yycolumn, yyline, yytext());}
    "CT"       {System.out.println("pr_ct "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_ct, yycolumn, yyline, yytext());}
    "FIN-CT"       {System.out.println("pr_finct "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finct, yycolumn, yyline, yytext());}
    "TEXTO_A"  {System.out.println("pr_texto_a "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_texto_a, yycolumn, yyline, yytext());}
    "FIN-TEXTO_A"  {System.out.println("pr_fintexto_a "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fintexto_a, yycolumn, yyline, yytext());}
    "CAJA"   {System.out.println("pr_caja  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_caja, yycolumn, yyline, yytext());}
    "FIN-CAJA"   {System.out.println("pr_fincaja  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_fincaja, yycolumn, yyline, yytext());}
    "OPCION"    {System.out.println("pr_opcion "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_opcion, yycolumn, yyline, yytext());}
    "FIN-OPCION"    {System.out.println("pr_finopcion "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_finopcion, yycolumn, yyline, yytext());}
    "SPINNER"   {System.out.println("pr_spinner "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_spinner, yycolumn, yyline, yytext());}
    "FIN-SPINNER"   {System.out.println("pr_finspinner "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_finspinner, yycolumn, yyline, yytext());}
    "SALTO-FIN"        {System.out.println("pr_salto "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_salto, yycolumn, yyline, yytext());}
    "click"       {System.out.println("pr_click "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_click, yycolumn, yyline, yytext());}
    "ruta"       {System.out.println("pr_ruta "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_ruta, yycolumn, yyline, yytext());}

    "id"  {System.out.println("pr_id "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_id, yycolumn, yyline, yytext());}
    "grupo"       {System.out.println("pr_grupo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_grupo, yycolumn, yyline, yytext());}
    "alto"   {System.out.println("pr_alto  "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_alto, yycolumn, yyline, yytext());}
    "ancho"    {System.out.println("pr_ancho "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_ancho, yycolumn, yyline, yytext());}
    "alineado"   {System.out.println("pr_alineado"+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.pr_alineado, yycolumn, yyline, yytext());}
    "ccss"        {System.out.println("pr_atri_ccss "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_atri_ccss, yycolumn, yyline, yytext());}
    "valor"        {System.out.println("pr_valor "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.pr_valor, yycolumn, yyline, yytext());}
    
    {numero}        {System.out.println("numero "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline); return new Symbol(Simbolos.numero, yycolumn, yyline, yytext());}
    {identificador} {System.out.println("id "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.identificador, yycolumn, yyline, yytext());}
    {cadena_dos} {System.out.println("cadena "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext());}
    {otro_simb} {System.out.println("simbolooo "+ yytext()+" columna: "+ yycolumn +" linea: "+ yyline);return new Symbol(Simbolos.otro_simb, yycolumn, yyline, yytext());}
    
}


<MULTI>
{
    "-//>"    {System.out.println("Comentario multi: "+comentario);
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

<STRING_CENTRO>{
    [^"-/"]     {colector_cadena += yytext();}
    "-/"        {
        String cadena_temporal = colector_cadena; 
        colector_cadena = ""; 
        yybegin(YYINITIAL); 
        System.out.println("Comentario dentro etiquetas: "+cadena_temporal);
        return new Symbol(Simbolos.cadena2, yycolumn, yyline, cadena_temporal);
           
     }

}

[ \t\r\n\f]     {}

.           {System.out.println("simbolo: <<"+yytext()+">> ["+yyline+" , "+yycolumn+"]");
            return new Symbol(Simbolos.ptodo, yycolumn, yyline, yytext());
             //Listado_Errores.add(new Nodo_Error(yytext(),yycolumn,yyline,"Error Lexico","El caracter no pertenece al lenguaje"));   
            }
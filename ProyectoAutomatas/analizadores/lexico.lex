package analizadores;
import java_cup.runtime.Symbol; 

%% 
%class Lexico
%public 
%line 
%char 
%cup 
%unicode
%ignorecase
%full

%init{ 
    yyline = 1; 
    yychar = 1; 
%init} 

espacios=\r|\t|\f|" "|\n
d=[0-9]
de=[0-9]+("."[  |0-9]+)?
val = [_a-zA-Z][_a-zA-Z0-9]*

%%


";" {return new Symbol(sym.PTCOMA,yyline,yychar, yytext());} 
"(" {return new Symbol(sym.PARIZQ,yyline,yychar, yytext());} 
")" {return new Symbol(sym.PARDER,yyline,yychar, yytext());} 

"+" {return new Symbol(sym.MAS,yyline,yychar, yytext());} 
"-" {return new Symbol(sym.MENOS,yyline,yychar, yytext());} 
"*" {return new Symbol(sym.POR,yyline,yychar, yytext());} 
"/" {return new Symbol(sym.DIVIDIDO,yyline,yychar, yytext());} 

"int"      { return new Symbol(sym.INT, yychar, yyline, yytext());}
"double"   { return new Symbol(sym.DOUBLE, yychar, yyline, yytext());}
"="        { return new Symbol(sym.IGUAL, yychar, yyline, yytext()); }
\"[^\"]*\" { return new Symbol(sym.TEXTO,yytext().substring(1,yytext().length()-1));}
","        { return new Symbol(sym.COMA, yychar, yyline, yytext());}
"REPETIR"  { return new Symbol(sym.REPETIR, yychar, yyline, yytext()); }
"IMPRIMIR" { return new Symbol(sym.IMPRIMIR, yychar, yyline, yytext()); }
{d}+       { return new Symbol(sym.NUMERO, yychar, yyline, new Integer(yytext()));}
{de}+      { return new Symbol(sym.DECIMAL, yychar, yyline, new Double(yytext()));}
{val}       { return new Symbol(sym.IDENTIFICADOR, yychar, yyline, new String(yytext()));}
{espacios}+  {;}

. {
    System.out.println("Este es un error lexico: "+yytext()+
    ", en la linea: "+yyline+", en la columna: "+yychar);
}


// Lexer.flex
%%
%class Lexer
%unicode
%line
%column
%cup
%{
    private void lexError(String msg) {
        System.err.println("Error léxico (Línea " + yyline + ", Columna " + yycolumn + "): " + msg);
    }
%}

// Definiciones
DIGIT = [0-9]
LETTER = [a-zA-Z_]
ID = {LETTER}({LETTER}|{DIGIT})*
INT = {DIGIT}+
FLOAT = {DIGIT}+"."{DIGIT}*
STRING = \"([^\"\\]|\\.)*\"
BOOL = "true"|"false"
COMMENT = "//".*|"/*"(.|\n)*?"*/"

%%
// Palabras reservadas
"if"        { return new Symbol(Symbols.IF, yytext()); }
"else"      { return new Symbol(Symbols.ELSE, yytext()); }
"while"     { return new Symbol(Symbols.WHILE, yytext()); }
"print"     { return new Symbol(Symbols.PRINT, yytext()); }
"input"     { return new Symbol(Symbols.INPUT, yytext()); }
"int"       { return new Symbol(Symbols.INT_TYPE, yytext()); }
"float"     { return new Symbol(Symbols.FLOAT_TYPE, yytext()); }
"string"    { return new Symbol(Symbols.STRING_TYPE, yytext()); }
"bool"      { return new Symbol(Symbols.BOOL_TYPE, yytext()); }
"function"  { return new Symbol(Symbols.FUNCTION, yytext()); }
"return"    { return new Symbol(Symbols.RETURN, yytext()); }

// Literales y operadores
{INT}       { return new Symbol(Symbols.INT_LIT, new Integer(yytext())); }
{FLOAT}     { return new Symbol(Symbols.FLOAT_LIT, new Float(yytext())); }
{STRING}    { return new Symbol(Symbols.STRING_LIT, yytext().substring(1, yytext().length()-1)); }
{BOOL}      { return new Symbol(Symbols.BOOL_LIT, Boolean.parseBoolean(yytext())); }
{ID}        { return new Symbol(Symbols.ID, yytext()); }

"+"         { return new Symbol(Symbols.PLUS, yytext()); }
"-"         { return new Symbol(Symbols.MINUS, yytext()); }
"*"         { return new Symbol(Symbols.MUL, yytext()); }
"/"         { return new Symbol(Symbols.DIV, yytext()); }
"%"         { return new Symbol(Symbols.MOD, yytext()); }
"=="        { return new Symbol(Symbols.EQ, yytext()); }
"!="        { return new Symbol(Symbols.NEQ, yytext()); }
"<"         { return new Symbol(Symbols.LT, yytext()); }
">"         { return new Symbol(Symbols.GT, yytext()); }
"<="        { return new Symbol(Symbols.LEQ, yytext()); }
">="        { return new Symbol(Symbols.GEQ, yytext()); }
"&&"        { return new Symbol(Symbols.AND, yytext()); }
"||"        { return new Symbol(Symbols.OR, yytext()); }
"!"         { return new Symbol(Symbols.NOT, yytext()); }

"="         { return new Symbol(Symbols.ASSIGN, yytext()); }
"("         { return new Symbol(Symbols.LPAREN, yytext()); }
")"         { return new Symbol(Symbols.RPAREN, yytext()); }
"{"         { return new Symbol(Symbols.LBRACE, yytext()); }
"}"         { return new Symbol(Symbols.RBRACE, yytext()); }
";"         { return new Symbol(Symbols.SEMICOLON, yytext()); }
","         { return new Symbol(Symbols.COMMA, yytext()); }

{COMMENT}   { /* Ignorar comentarios */ }
[ \t\n\r]   { /* Ignorar espacios */ }
.           { lexError("Símbolo inválido: '" + yytext() + "'"); }

<<EOF>>     { return new Symbol(Symbols.EOF); }

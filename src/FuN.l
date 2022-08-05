package FuN;

import java.io.*;
import java.util.*;
import java.lang.*;

class Token {
    String value;
    int token;
    Token ( int token, String value){
        this.value = value;
        this.token = token;
    }
    public String toString() {
        return String.format("%s %s", token, value);
    }
    public Object value(){
        return this.value;
    }
    public Integer parseInt() {
        return Integer.parseInt(this.value);
    }
   
}

%%

%unicode
%standalone
%{
    StringBuffer stringbuffer = new StringBuffer();
    List<Token> tokens = new ArrayList<Token>();
%}

COMMENT = "(*" .+ "*)"
LPAREN = "("
RPAREN = ")"
EQUAL = "=="
TANGLE = "<>"
LANGLE = "<"
RANGLE = ">"
LANGLEEQ = "<="
RANGLEEQ = ">="
PLUS = "+"
SUB = "-"
MULTIPLY = "*"
DIVIDE = "/"
MODULO = "mod"
AND = "&"
OR = "|"
FUN = "fun"
IF = "if"
THEN = "then"
ELSE = "else"
LET = "let"
REC = "rec"
IN = "in"
TRUE = "true"
FALSE = "false"
NOT = "not"
RETURN = "return"
WS = [ \t\n\r]+
NUMBER = [0-9]+
CHAR = [a-zA-Z0-9_]
IDENTIFIER = [A-Za-z] {CHAR}*
CONDITIONAL = ({IF} | {THEN} | {ELSE} | {FOR} | {RETURN})

%%

<YYINITIAL>{ 
{LPAREN} {return new Token(FuN.LPAREN, yytext());}
{RPAREN} {return new Token(FuN.RPAREN, yytext());}
{EQUAL} {return new Token(FuN.EQUAL, yytext());}
{TANGLE} {return new Token(FuN.TANGLE, yytext());}
{LANGLE} {return new Token(FuN.LANGLE, yytext());}
{RANGLE} {return new Token(FuN.RANGLE, yytext());}
{LANGLEEQ} {return new Token(FuN.LANGLEEQ, yytext());}
{RANGLEEQ} {return new Token(FuN.RANGLEEQ, yytext());}
{PLUS} {return new Token(FuN.PLUS, yytext());}
{SUB} {return new Token(FuN.SUB, yytext());}
{MULTIPLY} {return new Token(FuN.MULTIPLY, yytext());}
{DIVIDE} {return new Token(FuN.DIVIDE, yytext());}
{MODULO} {return new Token(FuN.MODULO, yytext());}
{AND} {return new Token(FuN.AND, yytext());}
{OR} {return new Token(FuN.OR, yytext());}
{FUN} {return new Token(FuN.FUN, yytext());}
{LET} {return new Token(FuN.LET, yytext());}
{REC} {return new Token(FuN.REC, yytext());}
{IN} {return new Token(FuN.IN, yytext());}
{TRUE} {return new Token(FuN.TRUE, yytext());}
{FALSE} {return new Token(FuN.FALSE, yytext());}
{NOT} {return new Token(FuN.NOT, yytext());}
{NUMBER} {return new Token(FuN.NUMBER, yytext());}
{IDENTIFIER} {return new Token (FuN.IDENTIFIER, yytext());}
{COMMENT} {}

{WS}  {}
}

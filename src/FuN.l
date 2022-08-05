package fun;

import java.io.*;
import java.util.*;
import java.lang.*;

class Token {
    String value;
    Object token;
    public Token ( Object token, String value){
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
{LPAREN} {return new Token(fun.LPAREN, yytext());}
{RPAREN} {return new Token(fun.RPAREN, yytext());}
{EQUAL} {return new Token(fun.EQUAL, yytext());}
{TANGLE} {return new Token(fun.TANGLE, yytext());}
{LANGLE} {return new Token(fun.LANGLE, yytext());}
{RANGLE} {return new Token(fun.RANGLE, yytext());}
{LANGLEEQ} {return new Token(fun.LANGLEEQ, yytext());}
{RANGLEEQ} {return new Token(fun.RANGLEEQ, yytext());}
{PLUS} {return new Token(fun.PLUS, yytext());}
{SUB} {return new Token(fun.SUB, yytext());}
{MULTIPLY} {return new Token(fun.MULTIPLY, yytext());}
{DIVIDE} {return new Token(fun.DIVIDE, yytext());}
{MODULO} {return new Token(fun.MODULO, yytext());}
{AND} {return new Token(fun.AND, yytext());}
{OR} {return new Token(fun.OR, yytext());}
{FUN} {return new Token(fun.FUN, yytext());}
{LET} {return new Token(fun.LET, yytext());}
{REC} {return new Token(fun.REC, yytext());}
{IN} {return new Token(fun.IN, yytext());}
{TRUE} {return new Token(fun.TRUE, yytext());}
{FALSE} {return new Token(fun.FALSE, yytext());}
{NOT} {return new Token(fun.NOT, yytext());}
{NUMBER} {return new Token(fun.NUMBER, yytext());}
{IDENTIFIER} {return new Token (fun.IDENTIFIER, yytext());}
{COMMENT} {}

{WS}  {}
}

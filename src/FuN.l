package FuN;

import java.io.*;
import java.util.*;
import java.lang.*;

class Token {
    String value;
    int token;
    Token (String value, int token){
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
    public int tokenToInt(){
        return this.token.ordinal();
    }
}

%%

%unicode
/*{
    StringBuffer stringbuffer = new StringBuffer();
 %}*/

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
{LPAREN} {return new Token(FuNLexer.LPAREN, yytext());}
{RPAREN} {return new Token(FuNLexer.RPAREN, yytext());}
{EQUAL} {return new Token(FuNLexer.EQUAL, yytext());}
{TANGLE} {return new Token(FuNLexer.TANGLE, yytext());}
{LANGLE} {return new Token(FuNLexer.LANGLE, yytext());}
{RANGLE} {return new Token(FuNLexer.RANGLE, yytext());}
{LANGLEEQ} {return new Token(FuNLexer.LANGLEEQ, yytext());}
{RANGLEEQ} {return new Token(FuNLexer.RANGLEEQ, yytext());}
{PLUS} {return new Token(FuNLexer.PLUS, yytext());}
{SUB} {return new Token(FuNLexer.SUB, yytext());}
{MULTIPLY} {return new Token(FuNLexer.MULTIPLY, yytext());}
{DIVIDE} {return new Token(FuNLexer.DIVIDE, yytext());}
{MODULO} {return new Token(FuNLexer.MODULO, yytext());}
{AND} {return new Token(FuNLexer.AND, yytext());}
{OR} {return new Token(FuNLexer.OR, yytext());}
{FUN} {return new Token(FuNLexer.FUN, yytext());}
{LET} {return new Token(FuNLexer.LET, yytext());}
{REC} {return new Token(FuNLexer.REC, yytext());}
{IN} {return new Token(FuNLexer.IN, yytext());}
{TRUE} {return new Token(FuNLexer.TRUE, yytext());}
{FALSE} {return new Token(FuNLexer.FALSE, yytext());}
{NOT} {return new Token(FuNLexer.NOT, yytext());}
{NUMBER} {return new Token(FuNLexer.NUMBER, yytext());}
{IDENTIFIER} {return new Token (FuNLexer.IDENTIFIER, yytext());}
{COMMENT} {}

{WS}  {}
}

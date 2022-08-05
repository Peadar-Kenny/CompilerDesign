package FuN;

import java.io.*;
import java.util.*;
import java.lang.*;

class Token {
    Object value;
    TokenType token;
    Token (object value, TokenType token){
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
%public
%standalone
%unicode

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
{LPAREN} {return(FuNLexer.LPAREN);}
{RPAREN} {return(FuNLexer.RPAREN);}
{EQUAL} {return(FuNLexer.EQUAL);}
{TANGLE} {return(FuNLexer.TANGLE);}
{LANGLE} {return(FuNLexer.LANGLE);}
{RANGLE} {return(FuNLexer.RANGLE);}
{LANGLEEQ} {return(FuNLexer.LANGLEEQ);}
{RANGLEEQ} {return(FuNLexer.RANGLEEQ);}
{PLUS} {return(FuNLexer.PLUS);}
{SUB} {return(FuNLexer.SUB);}
{MULTIPLY} {return(FuNLexer.MULTIPLY);}
{DIVIDE} {return(FuNLexer.DIVIDE);}
{MODULO} {return(FuNLexer.MODULO);}
{AND} {return(FuNLexer.AND);}
{OR} {return(FuNLexer.OR);}
{FUN} {return(FuNLexer.FUN);}
{LET} {return(FuNLexer.LET);}
{REC} {return(FuNLexer.REC);}
{IN} {return(FuNLexer.IN);}
{TRUE} {return(FuNLexer.TRUE);}
{FALSE} {return(FuNLexer.FALSE);}
{NOT} {return(FuNLexer.NOT);}
{NUMBER} {return(FuNLexer.NUMBER);}
{IDENTIFIER} {return (FuNLexer.IDENTIFIER);}
{COMMENT} {}

{WS}  {}
}

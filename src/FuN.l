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
        return String.format("%s %s", token, value)
    }
    public Object value(){
        return this.value;
    }
    public Integer parseInt() {
        return Integer.parseInt(this.value)
    }
    public int tokenToInt(){
        return this.token.ordinal()
    }
}
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
{LPAREN} {return(LPAREN)}
{RPAREN} {return(RPAREN)}
{EQUAL}{return(EQUAL)}
{TANGLE}{return(TANGLE)}
{LANGLE} {return(LANGLE)}
{RANGLE} {return(RANGLE)}
{LANGLEEQ} {return(LANGLEEQ)}
{RANGLEEQ} {return(RANGLEEQ)}
{PLUS} {return(PLUS)}
{SUB} {return(SUB)}
{MULTIPLY} {return(MULTIPLY)}
{DIVIDE} {return(DIVIDE)}
{MODULO} {return(MODULO)}
{AND} {return(AND)}
{OR} {return(OR)}
{FUN} {return(FUN)}
{LET} {return(LET)}
{REC} {return(REC)}
{IN}{return(IN)}
{TRUE} {return(TRUE)}
{FALSE} {return(FALSE)}
{NOT} {return(NOT)}
{NUMBER} {return(NUMBER)}
{IDENTIFIER} {return IDENTIFIER}
{COMMENT} {}

{WS} return {}

%%

int yywrap(){}
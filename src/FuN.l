package FuN;

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
%class Lexer
%cup
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

%type Token

%%

<YYINITIAL>{ 
{LPAREN} {System.out.println((yytext()));tokens.add(newToken(Yylex.LPAREN, yytext()));}
{RPAREN} {System.out.println((yytext()));tokens.add(new Token(FuN.RPAREN, yytext()));}
{EQUAL} {System.out.println((yytext()));tokens.add(new Token(FuN.EQUAL, yytext()));}
{TANGLE} {System.out.println((yytext()));tokens.add(new Token(FuN.TANGLE, yytext()));}
{LANGLE} {System.out.println((yytext()));tokens.add(new Token(FuN.LANGLE, yytext()));}
{RANGLE} {System.out.println((yytext()));tokens.add(new Token(FuN.RANGLE, yytext()));}
{LANGLEEQ} {System.out.println((yytext()));tokens.add(new Token(FuN.LANGLEEQ, yytext()));}
{RANGLEEQ} {System.out.println((yytext()));tokens.add(new Token(FuN.RANGLEEQ, yytext()));}
{PLUS} {System.out.println((yytext()));tokens.add(new Token(FuN.PLUS, yytext()));}
{SUB} {System.out.println((yytext()));tokens.add(new Token(FuN.SUB, yytext()));}
{MULTIPLY} {System.out.println((yytext()));tokens.add(new Token(FuN.MULTIPLY, yytext()));}
{DIVIDE} {System.out.println((yytext()));tokens.add(new Token(FuN.DIVIDE, yytext()));}
{MODULO} {System.out.println((yytext()));tokens.add(new Token(FuN.MODULO, yytext()));}
{AND} {System.out.println((yytext()));tokens.add(new Token(FuN.AND, yytext()));}
{OR} {System.out.println((yytext()));tokens.add(new Token(FuN.OR, yytext()));}
{FUN} {System.out.println((yytext()));tokens.add(new Token(FuN.FUN, yytext()));}
{LET} {System.out.println((yytext()));tokens.add(new Token(FuN.LET, yytext()));}
{REC} {System.out.println((yytext()));tokens.add(new Token(FuN.REC, yytext()));}
{IN} {System.out.println((yytext()));tokens.add(new Token(FuN.IN, yytext()));}
{TRUE} {System.out.println((yytext()));tokens.add(new Token(FuN.TRUE, yytext()));}
{FALSE} {System.out.println((yytext()));tokens.add(new Token(FuN.FALSE, yytext()));}
{NOT} {System.out.println((yytext()));tokens.add(new Token(FuN.NOT, yytext()));}
{NUMBER} {System.out.println((yytext()));tokens.add(new Token(FuN.NUMBER, yytext()));}
{IDENTIFIER} {System.out.println((yytext()));tokens.add(new Token (FuN.IDENTIFIER, yytext()));}
{COMMENT} {}

{WS}  {}
}

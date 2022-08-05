%language "Java"
%code imports {
  import java.io.BufferedReader;
  import java.io.IOException;
  import java.io.InputStream;
  import java.io.InputStreamReader;
  import java.io.Reader;
  import java.io.StreamTokenizer;
  import java.nio.CharBuffer;
}
%code {
  public static void main(String[] args) throws IOException {
   FuNParser parser = new FuNParser(); 
   if (!parser.parse())
   System.exit(1)
  }
}


%token
%token COMMENT 
%token LPAREN 
%token RPAREN 
%token EQUAL 
%token TANGLE 
%token LANGLE 
%token RANGLE 
%token LANGLEEQ 
%token RANGLEEQ 
%token PLUS 
%token SUB 
%token MULTIPLY 
%token DIVIDE 
%token MODULO 
%token AND 
%token OR 
-- %token FUN 
%token IF 
%token THEN
%token ELSE 
%token LET 
%token REC 
%token IN 
%token TRUE 
%token FALSE 
%token NOT 
%token RETURN 
%token WS 
%token NUMBER 
%token CHAR 
%token IDENTIFIER 
%token CONDITIONAL

%type FUN

%nonassoc "not" "-"
%left "*" "/" "mod"
%left "+" "-"
%left "==" "<>" "<" ">" "<=" ">="
%right "&&"
%right "||"
%nonassoc "else"
%nonassoc "then"
%nonassoc "fun"
%nonassoc "let"
%nonassoc "in"

%%
FUN: ID "->" exp {$$ = $4 }
| ID "->" FUN {$$ = $3}
| 

exp:
  NUM                { $$ = $1; }
| exp EQUAL exp
  {
    $$ = ($1 = $2)
  }
| exp PLUS exp        { $$ = $1 + $3;  }
| exp SUB exp        { $$ = $1 - $3;  }
| exp MULTIPLY exp        { $$ = $1 * $3;  }
| exp DIVIDE exp        { $$ = $1 / $3;  }
| SUB exp  %prec NEG { $$ = -$2; }
| LPAREN exp RPAREN        { $$ = $2; }
| LPAREN error RPAREN      { $$ = 1111; }
| "-" error          { $$ = 0; return YYERROR; }
;



%%
class FuNLexer implements FuN.Lexer {
 InputStreamReader it;
 Yylex yylex;
 public FuNLexer(InputStream is){
 it = new InputStreamReader(is);
 yylex = new Yylex(it);
 }
 @Override
 public void yyerror (String s){
 System.err.println(s);
 }
 ParserToken yylval;
 @Override
 public Object getLVal() {
 // Returns the semantic value of the last token that yylex returned.
 return yylval;
 }
 @Override
 public int yylex () throws IOException{
 // Returns the next token. Here we get the next Token from the Lexer
 return yylex.yylex();
 }
}
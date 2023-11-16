%token END 0
%token IF "if" WHILE "while" INPUT "?" PRINT "print" IDENTIFIER NUMCONST
%token OR "||" AND "&&" EQ "==" NE "!=" PP "++" MM "--" PL_EQ "+=" MI_EQ "-=" ASSIGN "="
%left  ','
%right '=' "+=" "-="
%left  "||"
%left  "&&"
%left  "==" "!="
%left  '+' '-'
%right '!' "++" "--"
%left  '?'
%left  '('
%%

library: stmts;

stmts: stmts stmt
|      %empty;

stmt: comp_stmt          '}'
|     IF    '(' expr ')' stmt
|     WHILE '(' expr ')' stmt
|     var_defs           ';'
|     PRINT expr         ';'
|     expr               ';'
|                        ';';

comp_stmt: '{'
|          comp_stmt stmt;

var_defs: var_defs ',' var_def1
|         var_def1;

var_def1: IDENTIFIER '=' expr
|         IDENTIFIER;

expr: NUMCONST
|     IDENTIFIER
|     expr '+'  expr
|     expr '-'  expr %prec '+'
|     expr "+=" expr
|     expr "-=" expr
|     expr "||" expr
|     expr "&&" expr
|     expr "==" expr
|     expr "!=" expr
|     expr ','  expr
|     '-'  expr
|     '+'  expr      %prec '-'
|     '!'  expr      %prec '-'
|     "++" expr
|     "--" expr      %prec "++"
|     expr "++"
|     expr "--"      %prec "++"
|     '?';
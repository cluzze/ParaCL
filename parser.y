%token DIGIT '0'

%left '-' '+'
%left '*' '/'
%%

factor: DIGIT
|       '(' expr ')'

term:   term '*' factor
|       term '/' factor
|       factor

expr:   expr '+' term
|       expr '-' term
|       term


%language "c++"

%skeleton "lalr1.cc"
%defines
%define api.value.type variant
%param {yy::Driver* driver}

%code requires
{
#include <iostream>
#include <string>

namespace yy { class Driver; }
}

%code
{
#include "driver.hpp"

namespace yy {
parser::token_type yylex(parser::semantic_type* yylval, Driver* driver);
}
}

%token IF    "if"
%token ELSE  "else"
%token WHILE "while"
%token INPUT "?"
%token PRINT "print"

%token EQUALS "=="
%token ASSIGN "="
%token PLUS_PLUS "++"
%token PLUS_EQ "+="
%token PLUS "+"
%token MINUS_MINUS "--"
%token MINUS_EQ "-="
%token MINUS "-"
%token MULT_EQ "*="
%token MULT "*"
%token DIV_EQ "/="
%token DIV "/"

%token LEFT_SHIFT_EQ "<<="
%token LEFT_SHIFT "<<"
%token LESS_EQ "<="
%token LESS "<"

%token RIGHT_SHIFT_EQ ">>="
%token RIGHT_SHIFT ">>"
%token GREATER_EQ ">="
%token GREATER ">"

%token OP_B  "("
%token CL_B  ")"
%token OP_CB "{"
%token CL_CB "}"
%token SEMI_COLON ";"
%token COLON ":"
%token COMMA ","

%token <std::string> IDENTIFIER
%token <int> NUMBER
%nterm <int> factor term expr
%nterm <int> equals


%left "-" "+"
%left "*" "/"
%%

equals: expr EQUALS expr {$$ = ($1 == $3);
                         std::cout << $1 << " vs " << $3 << " res: " << $$ << std::endl; }

expr:   expr PLUS term   {$$ = $1 + $3;}
|       expr MINUS term  {$$ = $1 + $3;}
|       term             {$$ = $1;}

term:   term MULT factor {$$ = $1 * $3;}
|       term DIV factor  {$$ = $1 / $3;}
|       factor           {$$ = $1;}

factor: NUMBER           {$$ = $1;}
|       OP_B expr CL_B   {$$ = $2;}

%%

namespace yy {
parser::token_type yylex(parser::semantic_type *yylval, Driver *driver) {
    return driver->yylex(yylval);
}

void parser::error(const std::string&) {}
}
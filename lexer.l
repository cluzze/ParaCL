%option c++
%option yylineno

%{

#include <iostream>
#include "parser.hpp"

%}

%x COMMENT

WS      [ \t\n\r\v]+
DIGIT   [0-9]
DIGIT1  [1-9]
ID      [a-zA-Z_][a-zA-Z_0-9]*
NUMBER  (0|[1-9][0-9]*)

%%

"*/" {
    std::cout << "ERROR on line " << yylineno << ": Unmatched */\n";
}

"/*" {
    BEGIN(COMMENT);
}

<COMMENT><<EOF>> {
    std::cout << "ERROR on line " << yylineno << ": Unterminated comment /*\n";
    BEGIN(INITIAL);
}

<COMMENT>. {}
<COMMENT>"*/" {
    BEGIN(INITIAL);
}

{WS}

"if"    return yy::parser::token_type::IF;
"else"  return yy::parser::token_type::ELSE;
"while" return yy::parser::token_type::WHILE;
"?"     return yy::parser::token_type::INPUT;
"print" return yy::parser::token_type::PRINT;

"=="    return yy::parser::token_type::EQUALS;
"="     return yy::parser::token_type::ASSIGN;

"++"    return yy::parser::token_type::PLUS_PLUS;
"+="    return yy::parser::token_type::PLUS_EQ;
"+"     return yy::parser::token_type::PLUS;

"--"    return yy::parser::token_type::MINUS_MINUS;
"-="    return yy::parser::token_type::MINUS_EQ;
"-"     return yy::parser::token_type::MINUS;

"*="    return yy::parser::token_type::MULT_EQ;
"*"     return yy::parser::token_type::MULT;

"/="    return yy::parser::token_type::DIV_EQ;
"/"     return yy::parser::token_type::DIV;

"<<="   return yy::parser::token_type::LEFT_SHIFT_EQ;
"<<"    return yy::parser::token_type::LEFT_SHIFT;
"<="    return yy::parser::token_type::LESS_EQ;
"<"     return yy::parser::token_type::LESS;

">>="   return yy::parser::token_type::RIGHT_SHIFT_EQ;
">>"    return yy::parser::token_type::RIGHT_SHIFT;
">="    return yy::parser::token_type::GREATER_EQ;
">"     return yy::parser::token_type::GREATER;

"("     return yy::parser::token_type::OP_B;
")"     return yy::parser::token_type::CL_B;
"{"     return yy::parser::token_type::OP_CB;
"}"     return yy::parser::token_type::CL_CB;
";"     return yy::parser::token_type::SEMI_COLON;
":"     return yy::parser::token_type::COLON;
","     return yy::parser::token_type::COMMA;

{ID}      return yy::parser::token_type::IDENTIFIER;
{NUMBER}  return yy::parser::token_type::NUMBER;
.         std::cout << "ERROR on line " << yylineno << ": " << yytext << "\n";

%%
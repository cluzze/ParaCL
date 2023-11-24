%option c++

%{

#include <iostream>

%}

WS      [ \t\n\r\v]+
DIGIT   [0-9]
DIGIT1  [1-9]
ID      [a-zA-Z_][a-zA-Z_0-9]*

%%

{WS}
"if"    std::cout << "if\n";
"else"  std::cout << "else\n";
"while" std::cout << "while\n";
"?"     std::cout << "input\n";
"print" std::cout << "output\n";

"=="    std::cout << "EQUALS\n";
"="     std::cout << "ASSIGN\n";

"++"    std::cout << "INCREMENT\n";
"+="    std::cout << "PLUS_EQ\n"
"+"     std::cout << "PLUS\n";

"--"    std::cout << "DECREMENT\n";
"-="    std::cout << "MINUS_EQ\n";
"-"     std::cout << "MINUS\n";

"<<="   std::cout << "LEFT_SHIFT_EQ\n";
"<<"    std::cout << "LEFT_SHIFT\n";
"<="    std::cout << "LESS_EQ\n";
"<"     std::cout << "LESS\n";

">>="   std::cout << "RIGHT_SHIFT_EQ\n";
">>"    std::cout << "RIGHT_SHIFT\n";
">="    std::cout << "GREATER_EQ\n";
">"     std::cout << "GREATER\n";

"("     std::cout << "OP_B\n";
")"     std::cout << "CL_B\n";
"{"     std::cout << "OP_CB\n";
"}"     std::cout << "CL_CB\n";
";"     std::cout << "SEMI_COLON\n";
":"     std::cout << "COLON\n";
","     std::cout << "COMMA\n";

ID      std::cout << "IDENTIFIER\n";

%%
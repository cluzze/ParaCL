#include <iostream>
#include "driver.hpp"
#include <FlexLexer.h>

int yyFlexLexer::yywrap() {
    return 1;
}

int main() {
    FlexLexer* lexer = new yyFlexLexer;
    yy::Driver driver(lexer);
    driver.parse();
}
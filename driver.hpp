#include "parser.hpp"
#include <FlexLexer.h>

namespace yy {
    class Driver {
    private:
        FlexLexer* flex_;
    public:
        Driver(FlexLexer *flex) : flex_{flex} {}

        parser::token_type yylex(parser::semantic_type *yylval) {
            parser::token_type tt = static_cast<parser::token_type>(flex_->yylex());
            if (tt == yy::parser::token_type::NUMBER)
                yylval->as<int>() = std::stoi(flex_->YYText());
            return tt;
        }

        bool parse() {
            parser parser(this);
            bool res = parser.parse();
            return res;
        }
    };
}
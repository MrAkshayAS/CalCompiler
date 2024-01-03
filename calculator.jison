%lex
%%
\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  { return 'NUMBER'; }
[-+*/()]              { return yytext; }
/lex

%start expressions

%%

expressions
  : e
    { console.log($1); }
  ;

e
  : e '+' term    { $$ = $1 + $3; }
  | e '-' term    { $$ = $1 - $3; }
  | term
  ;

term
  : term '*' factor  { $$ = $1 * $3; }
  | term '/' factor  { $$ = $1 / $3; }
  | factor
  ;

factor
  : factor '(' e ')'   { $$ = $1 * $3; }
  | NUMBER      { $$ = Number(yytext); }
  | factor '(' e ')'   { $$ = $1 * $3; }
  ;

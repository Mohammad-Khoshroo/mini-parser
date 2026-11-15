lexer grammar TemplateLexer;

// ============================================
// Keywords (Reserved Words)
// ============================================
MAIN: 'main';
IF: 'if';
ELSE: 'else';
INT: 'int';
BOOL: 'bool';
STRING: 'string';
TRUE: 'true';
FALSE: 'false';
PRINT: 'print';
FUNC: 'func';
VOID: 'void';
RETURN: 'return';
LAMBDA: 'lambda';

// ============================================
// Symbols and Operators
// ============================================
RARROW: '->';
DARROW: '=>';
LBRACE: '{';
RBRACE: '}';
SEMI: ';';
COL: ',';
ASSIGN: '=';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
PERCENT: '%';
LPAR: '(';
RPAR: ')';
LT: '<';
LEQ: '<=';
GT: '>';
GEQ: '>=';
EQ: '==';
NEQ: '!=';
NOT: '!';
LOGICAND: '&&';
LOGICOR: '||';

// ============================================
// Identifiers and Literals
// ============================================
ID: [a-zA-Z_][a-zA-Z0-9_]*;
STRING_VAL: '"' ( '\\' ["\\nrt] | ~["\\\r\n])* '"';
INT_VAL: '0' | [1-9][0-9]*;

// ============================================
// Ignored Whitespace and Comments
// ============================================
WHITE_SPACE: [ \t\r\n]+ -> skip;
LINE_COMMENT: '//' ~[\r\n]* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;

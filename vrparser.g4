grammar vrparser;

// ============================================ Parser Rules (Start with lowercase letters)
// ============================================

// Entry point rule: matches a sequence of statements followed by EOF
program: (statement)* EOF;

statement:
	expr ';'			# exprStatement
	| ID '=' expr ';'	# assignStatement
	| ';'				# emptyStatement;

// Expression hierarchy handling operator precedence (*, / over +, -)
expr:
	expr op = ('*' | '/') expr		# mulDivExpr
	| expr op = ('+' | '-') expr	# addSubExpr
	| '(' expr ')'					# parenExpr
	| ID							# idExpr
	| INT							# intExpr;

// ============================================ Lexer Rules (Start with uppercase letters)
// ============================================

ID: [a-zA-Z_][a-zA-Z0-9_]*;
INT: [0-9]+;

PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
ASSIGN: '=';
SEMI: ';';
LPAREN: '(';
RPAREN: ')';

// Ignore whitespace characters
WS: [ \t\r\n]+ -> skip;

// Unrecognized characters rule
UNKNOWN: .;
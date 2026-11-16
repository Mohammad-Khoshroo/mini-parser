parser grammar TemplateParser;

options {
	tokenVocab = TemplateLexer;
}

// ============================================ Program Structure
// ============================================
program: funcDec* main EOF;

funcDec: (VOID | type) ID LPAR ((type ID COL)* type ID)? RPAR LBRACE stmt* RBRACE;

main: MAIN LPAR RPAR LBRACE stmt* RBRACE;

// ============================================ Statements
// ============================================
stmt:
	assign
	| ifStmt
	| printStmt
	| varDec
	| block
	| funcCall SEMI
	| RETURN expr? SEMI;

block: LBRACE stmt* RBRACE;

// ============================================ Types ============================================
type: INT | BOOL | STRING | funcptr;

funcptr:
	FUNC LT (((type COL)* type) | VOID) RARROW (type | VOID) GT;

varDec: type ID (ASSIGN expr)? SEMI;
printStmt: PRINT LPAR expr RPAR SEMI;
assign: ID ASSIGN expr SEMI;

ifStmt: IF LPAR expr RPAR stmt (ELSE stmt)?;

// ============================================ Expressions (with Precedence)
// ============================================
expr:
	LPAR expr RPAR
	| expr (MULT | DIV | PERCENT) expr
	| unary expr
	| expr (PLUS | MINUS) expr
	| expr comp expr
	| expr logic expr
	| lambdaExpr
	| lambdaDec
	| primaryExpr;

unary: PLUS | MINUS | NOT;
comp: LT | LEQ | GT | GEQ | EQ | NEQ;
logic: LOGICAND | LOGICOR;

lambdaDec:
	LAMBDA LPAR ((type ID COL)* type ID)? RPAR DARROW expr;
lambdaExpr: LPAR lambdaDec RPAR LPAR ((expr COL)* expr)? RPAR;

funcCall: ID LPAR ((expr COL)* expr)? RPAR;

primaryExpr:
	ID
	| INT_VAL
	| TRUE
	| FALSE
	| STRING_VAL
	| funcCall;
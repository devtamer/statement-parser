# Statement Parser

This is a statement parser to identify invalid or valid inputs
given by the user, run the executable then provide a text file to check

### Files

parse.l
parse.y
makefile
README.txt
test.txt

### Examples of Valid Statements in Bison

- psuedocode for bison
  exp: statements

  statements: statements statement
  | statement
  | INVALIDTOKEN

  statement: assignment
  | correctExpression

  assignment: ID = expression ;

  correctExpression: expression ;

  expression: expression OP ( expression )
  | expression OP ID
  | ID

  ID: Any combinations of chars and digits but the first character has to be a char.

  OP: '+','-','\*','/','%'

-- How to Compile this Program
'make'
-- Or Manually doing the following
'bison -d parser.y'
'flex parser.l'
'g++ parser.tab.c lex.yy.c -ll -o parser'

- Run The Program Using Executable (Provide a txt file for input)
  ./parser
  You will then be prompted to enter an input file (ex: test.txt)

- DESIGN DECISIONS
  By using Flex and Bison to parse the statements, I was able to utilize the
  %error-verbose method to return the details of why the statements which were
  invalid happened to be invalid, it make returning errors less obtrusive

- Lessons Learned
  The power of combining a compilers and syntax parser and what type
  of cool programs you can use with them. I wish there were more recourses for statement
  and production writing when using bison

- Issues
  Had trouble getting all the invalid statements to print fully before the error message appeared,
  specifically those with multiple operators in a row

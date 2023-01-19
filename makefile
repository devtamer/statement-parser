# Author: Tamer Elsawaf ***/
# Systems Programming /  STATEMENT PARSER Project 3 */
bisonFile=parser.y
flexFile=parser.l
compArgs=parser.tab.c lex.yy.c -ll -o parser
rmArgs=parser parser.tab* lex.yy.c

parser: parser.l parser.y
	bison -d $(bisonFile)
	flex $(flexFile)
	g++ $(compArgs)

clean:
	rm $(rmArgs)
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.nio.file.*;

public class parser {
    public static void main(String[] args) throws Exception {
        String testFile = (args.length > 0) ? args[0] : "tests/07_expressions.sl";
        Path path = Paths.get(testFile);
        
        CharStream input;
        if (Files.exists(path)) {
            System.out.println("Reading test file: " + testFile);
            input = CharStreams.fromPath(path);
        } else {
            System.out.println("File not found (" + testFile + "). Using default inline test string...");
            input = CharStreams.fromString("main() { int x; x = 10 + 20 * 3; }");
        }

        // 1. Lexical analysis via TemplateLexer
        TemplateLexer lexer = new TemplateLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // 2. Syntax analysis via TemplateParser
        TemplateParser parser = new TemplateParser(tokens);
        ParseTree tree = parser.program();

        // 3. Display textual parse tree
        System.out.println("\n--- Parse Tree ---");
        System.out.println(tree.toStringTree(parser));

        // 4. Report error count
        int errorCount = parser.getNumberOfSyntaxErrors();
        System.out.println("\n--- Result ---");
        if (errorCount == 0) {
            System.out.println("Status: Parsing completed successfully (0 syntax errors).");
        } else {
            System.out.println("Status: Parsing completed with " + errorCount + " syntax error(s).");
        }
    }
}

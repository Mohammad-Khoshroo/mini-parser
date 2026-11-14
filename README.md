# How to run the PARSER

## 1. Running in WSL / Linux (Bash)

```bash
# Create output directory for generated ANTLR files
mkdir -p .antlr

# Generate lexer and parser source files from the grammar
java -jar utils/antlr-4.13.1-complete.jar -o .antlr vrparser.g4

# Compile the generated files and the main parser runner
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" parser.java .antlr/*.java

# Run the parser application
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" parser
```

### Clean up (WSL / Linux):
```bash
rm -rf .antlr && mkdir -p .antlr
```

---

## 2. Running in Windows (PowerShell)

In Windows, the Java classpath separator is `;` (semicolon) instead of `:` (colon):

```powershell
# Create output directory if it does not exist
if (!(Test-Path .antlr)) { New-Item -ItemType Directory -Path .antlr }

# Generate lexer and parser source files from the grammar
java -jar utils\antlr-4.13.1-complete.jar -o .antlr vrparser.g4

# Compile the generated files and the main parser runner
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" parser.java (Get-ChildItem .antlr\*.java)

# Run the parser application
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" parser
```

### Clean up (Windows PowerShell):
```powershell
if (Test-Path .antlr) { Remove-Item -Recurse -Force .antlr }; New-Item -ItemType Directory -Path .antlr
```
# mini-parser

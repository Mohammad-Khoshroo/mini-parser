# Mini-Parser (Syntax Analyzer Template)

A modular parser template based on ANTLR 4 supporting separated Lexer and Parser grammars:
* **`<GrammarName>Lexer.g4`**: Lexical rules, token definitions, keywords, operators, and literals.
* **`<GrammarName>Parser.g4`**: Context-free grammar rules for program structure, statements, types, and expressions.

---

## 1. Prerequisites

### A. Java Development Kit (JDK 11+)
* **WSL / Linux:**
  ```bash
  java -version && javac -version
  sudo apt update && sudo apt install default-jdk -y
  ```
* **Windows (PowerShell):**
  ```powershell
  java -version; javac -version
  winget install EclipseAdoptium.Temurin.17.JDK
  ```

### B. VS Code Extension
* **`ANTLR4 grammar syntax support`** (by *Mike Lischke*, ID: `mike-lischke.vscode-antlr4`).
* If working in WSL, ensure it is installed in WSL ("Install in WSL: Ubuntu").

---

## 2. Visual Parse Tree in VS Code (F5)

1. Place your test input file in the `tests/` directory (e.g. `tests/<test-file>`).
2. Ensure `.vscode/launch.json` specifies your parser grammar and test file:
   * `"grammar": "<GrammarName>Parser.g4"`
   * `"input": "tests/<test-file>"`
   * `"startRule": "<startRule>"` (e.g. `program`)
3. Press **`F5`** in VS Code.
4. The extension automatically parses the input file, displays the interactive **Visual Parse Tree** panel, and logs the textual tree to the **Debug Console**.

---

## 3. How to Build and Run via Terminal

> **Template Placeholders:**
> * `<GrammarName>`: Base name of your grammar (e.g., `MyLang`).
> * `<StartRule>`: The entry point rule of your parser (e.g., `program`).
> * `<TestFile>`: Path to your test input file (e.g., `tests/sample.txt`).

### A. In WSL / Linux (Bash)
```bash
# 1. Create output directory
mkdir -p .antlr

# 2. Generate Java files from both Lexer and Parser grammars
java -jar utils/antlr-4.13.1-complete.jar -o .antlr <GrammarName>Lexer.g4 <GrammarName>Parser.g4

# 3. Compile runner and generated sources
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" parser.java .antlr/*.java

# 4. Run the parser on a test file
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" parser <TestFile>
```

**Clean up (WSL / Linux):**
```bash
rm -rf .antlr && mkdir -p .antlr
```

---

### B. In Windows (PowerShell)
*(Note: Classpath delimiter is `;` on Windows)*

```powershell
# 1. Create output directory if it does not exist
if (!(Test-Path .antlr)) { New-Item -ItemType Directory -Path .antlr }

# 2. Generate Java files from both Lexer and Parser grammars
java -jar utils\antlr-4.13.1-complete.jar -o .antlr <GrammarName>Lexer.g4 <GrammarName>Parser.g4

# 3. Compile runner and generated sources
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" parser.java (Get-ChildItem .antlr\<GrammarName>*.java)

# 4. Run the parser on a test file
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" parser <TestFile>
```

**Clean up (Windows PowerShell):**
```powershell
if (Test-Path .antlr) { Remove-Item -Recurse -Force .antlr }; New-Item -ItemType Directory -Path .antlr
```

---

### C. In Windows (Command Prompt / CMD)
```cmd
:: 1. Create output directory
if not exist .antlr mkdir .antlr

:: 2. Generate Java files from both grammars
java -jar utils\antlr-4.13.1-complete.jar -o .antlr <GrammarName>Lexer.g4 <GrammarName>Parser.g4

:: 3. Compile
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" parser.java .antlr\*.java

:: 4. Run
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" parser <TestFile>
```

**Clean up (Windows CMD):**
```cmd
rmdir /s /q .antlr 2>nul & mkdir .antlr
```

---

## 4. Running via Built-in TestRig (`grun`)

* **Terminal Text Tree:**
  ```bash
  # WSL / Linux:
  java -cp ".antlr:utils/antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <GrammarName> <StartRule> -tree <TestFile>

  # Windows (PowerShell):
  java -cp ".antlr;utils\antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <GrammarName> <StartRule> -tree <TestFile>
  ```

* **Desktop GUI Tree Window:**
  ```bash
  # WSL / Linux:
  java -cp ".antlr:utils/antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <GrammarName> <StartRule> -gui <TestFile>

  # Windows (PowerShell):
  java -cp ".antlr;utils\antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <GrammarName> <StartRule> -gui <TestFile>
  ```

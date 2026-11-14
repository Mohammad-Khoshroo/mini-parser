# Mini-Parser (Syntax Analyzer)

A standalone parser project based on ANTLR 4 that performs lexical and syntax analysis, validates input statements against a grammar, and produces a concrete parse tree (CST / AST).

---

## 1. Prerequisites

### A. Java Development Kit (JDK)
Ensure Java (version 11 or higher, recommended 17 or 21) is installed:
* **WSL / Linux:**
  ```bash
  # Check installation
  java -version && javac -version

  # Install if missing (Ubuntu/Debian)
  sudo apt update && sudo apt install default-jdk -y
  ```
* **Windows (PowerShell):**
  ```powershell
  # Check installation
  java -version; javac -version

  # Install via winget if missing
  winget install EclipseAdoptium.Temurin.17.JDK
  ```

### B. VS Code Extensions
1. **ANTLR4 grammar syntax support** (by *Mike Lischke*, ID: `mike-lischke.vscode-antlr4`):
   * Provides graphical parse tree rendering, debugger integration, syntax highlighting, and railroad diagrams.
   * **Important (WSL Users):** When working in VS Code Remote-WSL (`WSL: Ubuntu`), go to the Extensions tab and click **"Install in WSL: Ubuntu"** for this extension.
2. **WSL** (by *Microsoft*):
   * Required when developing inside WSL from VS Code.

---

## 2. Viewing the Graphical Parse Tree in VS Code

You can view the interactive visual parse tree in VS Code through multiple convenient methods:

### Method 1: Automatic Parsing from File via F5
This method reads the test string directly from a file, logs results to the Debug Console, and automatically opens the visual parse tree.

1. Put your test string/expression inside **`tests/input.txt`** (e.g., `x = 10 + 20 * 3;`).
2. Press **`F5`** on your keyboard (or go to the **Run and Debug** tab in VS Code and click the green Play button: *"ANTLR4: Visual Parse Tree from File"*).
3. **Result:**
   * The textual parse tree and syntax error logs are printed in the **Debug Console**.
   * An interactive **Visual Parse Tree** webview panel opens automatically, displaying the color-coded parse tree nodes.

> **Note:** This feature is configured via `.vscode/launch.json` and `.vscode/settings.json`.

---

### Method 2: Interactive Webview via Right-Click
1. Open `vrparser.g4`.
2. Right-click on the start rule (`program`).
3. Select **"ANTLR4: Show Graphical Parse Tree"**.
4. In the opened panel, type your input string to view the live tree and token stream.

---

### Method 3: Railroad Diagrams
1. Open `vrparser.g4`.
2. Right-click on any parser or lexer rule (e.g. `expr` or `program`).
3. Select **"ANTLR4: Show Railroad Diagram for Rule"** to view a visual flowchart of that production rule.

---

## 3. Running the Parser via Terminal

### Option A: Running in WSL / Linux (Bash)
```bash
# 1. Create output directory
mkdir -p .antlr

# 2. Generate lexer and parser source files
java -jar utils/antlr-4.13.1-complete.jar -o .antlr vrparser.g4

# 3. Compile parser.java and generated sources
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" parser.java .antlr/*.java

# 4. Run the parser application
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" parser
```

**Clean up (WSL / Linux):**
```bash
rm -rf .antlr && mkdir -p .antlr
```

---

### Option B: Running in Windows (PowerShell)
*(Note: In Windows, the classpath separator is `;` instead of `:`)*

```powershell
# 1. Create output directory if it does not exist
if (!(Test-Path .antlr)) { New-Item -ItemType Directory -Path .antlr }

# 2. Generate lexer and parser source files
java -jar utils\antlr-4.13.1-complete.jar -o .antlr vrparser.g4

# 3. Compile parser.java and generated sources
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" parser.java (Get-ChildItem .antlr\*.java)

# 4. Run the parser application
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" parser
```

**Clean up (Windows PowerShell):**
```powershell
if (Test-Path .antlr) { Remove-Item -Recurse -Force .antlr }; New-Item -ItemType Directory -Path .antlr
```

---

### Option C: Running in Windows (Command Prompt / CMD)
```cmd
:: 1. Create directory if not exists
if not exist .antlr mkdir .antlr

:: 2. Generate lexer and parser source files
java -jar utils\antlr-4.13.1-complete.jar -o .antlr vrparser.g4

:: 3. Compile
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" parser.java .antlr\*.java

:: 4. Run
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" parser
```

**Clean up (Windows CMD):**
```cmd
rmdir /s /q .antlr 2>nul & mkdir .antlr
```

---

## 4. Using ANTLR's Built-in TestRig (`grun`) Directly on Files

You can also run ANTLR's built-in GUI or textual tree inspector directly on `tests/input.txt`:

* **Graphical Window (Desktop GUI):**
  * WSL / Linux:
    ```bash
    java -cp ".antlr:utils/antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig vrparser program -gui tests/input.txt
    ```
  * Windows (PowerShell):
    ```powershell
    java -cp ".antlr;utils\antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig vrparser program -gui tests\input.txt
    ```

* **Textual Tree (Export to log):**
  * WSL / Linux:
    ```bash
    java -cp ".antlr:utils/antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig vrparser program -tree tests/input.txt > tests/tree.log
    ```
  * Windows (PowerShell):
    ```powershell
    java -cp ".antlr;utils\antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig vrparser program -tree tests\input.txt > tests\tree.log
    ```

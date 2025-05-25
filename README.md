# FormLang++: A DSL for HTML Form Generation

FormLang++ is a custom Domain-Specific Language (DSL) for defining structured web forms. Using Lex and Yacc, this project converts .form files into functional HTML forms with embedded validation. It demonstrates compiler construction, DSL design, and semantic translation into HTML.

---

## Project Structure

---

## How It Works

1. Users write form definitions in `.form` files using a clean DSL syntax.
2. Lex scans tokens from the input.
3. Yacc parses grammar and generates HTML code using semantic actions.
4. The output is saved as `output.html`.

---

## Build & Run Instructions

Recommended: Using Docker

1. Build the Docker image:
   docker build -t formlang .

2. Run the container:
   docker run -it --rm -v "$PWD":/workspace formlang

3. Inside the container, compile:
   bison -d parser.y
   flex lexer.l
   gcc -o formgen parser.tab.c lex.yy.c formgen.c -lfl

4. Run the executable:
   ./formgen example.form
   cat output.html

---

## Features

- Intuitive DSL syntax for form creation
- HTML input types: text, number, checkbox, dropdown, etc.
- Validation with conditional logic
- Clear semantic error handling
- Runs natively or via Docker

---

## Output Files

- parser.tab.c / parser.tab.h - Yacc output
- lex.yy.c - Lex output
- formgen - Compiled binary
- output.html - Generated HTML

---

## Testing

Test valid and invalid DSL forms:
./formgen example.form
./formgen exampleErr.form

---

## Demo

Demo video: demo.mp4 or YouTube link (if available)

---

## License & Attribution

Developed as part of SE2062 – Programming Paradigms course.
For academic use only.

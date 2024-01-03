const fs = require('fs');
const parser = require('./calculator');

// Read input from a file
const inputFile = process.argv[2];
const inputCode = fs.readFileSync(inputFile, 'utf-8');

// Parse the input code
try {
  const result = parser.parse(inputCode);
//   console.log('Parsed AST:', result); // this code for checking Parsed AST : True or False
} catch (error) {
  console.error('Parse Error:', error.message);
}

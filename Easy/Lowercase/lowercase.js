// Returns the answer to the test case.
function answer(a){
	// Print the result as a lowercase value.
	return a.toLowerCase();
}

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== "") {
        console.log(answer(line));
    }
});
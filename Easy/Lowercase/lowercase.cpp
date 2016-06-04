#include <iostream>
#include <fstream>
using namespace std;

string toLower(string inp){
	for(auto i = inp.begin(); i != inp.end(); i++)
		if((*i) > 'A' && (*i) < 'Z')
			(*i)+=('a'-'A');
	return inp
}

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        // Do something with the line
    }
    return 0;
}
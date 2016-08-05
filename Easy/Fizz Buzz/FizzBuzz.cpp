#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <cstdlib>
using namespace std;

vector<string> split(string s, char delim) {
	vector<string> elems = vector<string>();
    stringstream ss(s);
    string item;
    while (getline(ss, item, delim)) {
		if(!item.empty()){
	        elems.push_back(item);
		}
    }
    return elems;
}

vector<int> stoim(vector<string> in){
	vector<int> result = vector<int>();
	for(auto i = in.begin(); i!=in.end(); i++)
		result.push_back(atoi(i->c_str()));
	return result;
}

void FizzBuzz(int a, int b, int c){
	for(int i = 1; i <= c; i++){
		if(i % a == 0 && i % b == 0){
			cout << "FB";
		} else if (i % a == 0) { 
			cout << "F";
		}  else if (i % b == 0) {
			cout << "B";
		}  else {
			cout << i;
		}
		if(i != c) { cout << " ";} else {cout << endl; }
	}
}

int main(int argc, char *argv[]) {
	ifstream stream(argv[1]);
	string line;
	while (getline(stream, line)) {
		if(line == "\n" || line == "") {continue;}
		auto t = split(line,' ');
		auto r = stoim(t);
		FizzBuzz(r[0],r[1],r[2]);
	}	
	return 0;
}
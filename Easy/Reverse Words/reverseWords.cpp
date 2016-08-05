#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
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

string join(vector<string> s, char delim) {
	stringstream ss;
	for(auto i = s.begin(); i != s.end(); i++){
		ss << (*i);
		if(i+1 != s.end()){
			ss << delim;
		}
	}
	return ss.str();
}

template<typename T>
vector<T> reverse(vector<T> in){
	vector<T>output = vector<T>();
	for(auto i = in.rbegin(); i != in.rend(); i++){
		output.push_back(*i);
	}
	return output;
}

int main(int argc, char *argv[]) {
	ifstream stream(argv[1]);
	string line;
	while (getline(stream, line)) {
		if(line == "\n" || line == "") {continue;}
		auto r = split(line,' ');
		r = reverse(r);
		cout << join(r,' ') << endl;
	}	
	return 0;
}
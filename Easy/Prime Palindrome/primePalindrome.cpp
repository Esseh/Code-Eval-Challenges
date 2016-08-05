#include<iostream>
#include<sstream>
#include<cmath>
using namespace std;

template<typename T>
string outputToString(T v){
	stringstream buffer;
	buffer << v;
	return buffer.str();
}

template<typename T>
bool isPalindrome(T v){
	string t = outputToString(v);
	auto i1 = t.begin();
	auto i2 = t.rbegin();
	while(i1 != t.end() && i2 != t.rend()){
		if((*i1) != (*i2)){return false;}
		else {
			i1++;
			i2++;
		}
	}
	return true;
}

bool isPrime(int v){
	if(v == 1) { return false; }
	for(int i = 2; i <= sqrt(v); i++) if(v % i == 0) return false;
	return true;
}

int main(){
	int i = 999;
	while(!(isPrime(i) && isPalindrome(i))) i--;
	cout << i << endl;
}

#include "string"   
#include<vector>
#include<iostream>
#include<fstream>
#include<cmath>
#include<queue>
#define ll long long
using namespace std;






string h2b(char ch){
    string bin;
    switch(ch){
        
        case '0': bin = "0000"; break;
        case '1': bin = "0001"; break;
        case '2': bin = "0010"; break;
        case '3': bin = "0011"; break;
        case '4': bin = "0100"; break;
        case '5': bin = "0101"; break;
        case '6': bin = "0110"; break;
        case '7': bin = "0111"; break;
        case '8': bin = "1000"; break;
        case '9': bin = "1001"; break;
        case 'a': bin = "1010"; break;
        case 'b': bin = "1011"; break;
        case 'c': bin = "1100"; break;
        case 'd': bin = "1101"; break;
        case 'e': bin = "1110"; break;
        case 'f': bin = "1111"; break;
    
    }


    return bin;
}

int b2d(string bin){
    int dec = 0;
    int deg = 1;
    for(int i = bin.size()-1; i >= 0; i--){
        if(bin[i]=='1')dec += 1*deg;
        deg *= 2;
    }
    return dec;
}


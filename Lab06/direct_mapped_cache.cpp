#include "direct_mapped_cache.h"
#include "string"
#include<vector>
#include<iostream>
#include<fstream>
#include<cmath>
#include "extra.h"
// #include<pair>
#define ll long long


using namespace std;


// string h2b(char ch){
//     string bin;
//     switch(ch){
        
//         case '0': bin = "0000"; break;
//         case '1': bin = "0001"; break;
//         case '2': bin = "0010"; break;
//         case '3': bin = "0011"; break;
//         case '4': bin = "0100"; break;
//         case '5': bin = "0101"; break;
//         case '6': bin = "0110"; break;
//         case '7': bin = "0111"; break;
//         case '8': bin = "1000"; break;
//         case '9': bin = "1001"; break;
//         case 'a': bin = "1010"; break;
//         case 'b': bin = "1011"; break;
//         case 'c': bin = "1100"; break;
//         case 'd': bin = "1101"; break;
//         case 'e': bin = "1110"; break;
//         case 'f': bin = "1111"; break;
    
//     }


//     return bin;
// }

// int b2d(string bin){
//     int dec = 0;
//     int deg = 1;
//     for(int i = bin.size()-1; i >= 0; i--){
//         if(bin[i]=='1')dec += 1*deg;
//         deg *= 2;
//     }
//     return dec;
// }



float direct_mapped(string filename, int block_size, int cache_size)
{
    int total_num = -1;
    int hit_num = 0;
    
    /*write your code HERE*/
    ifstream fin;
    fin.open(filename);
    

    
    string addr;
    ll num_block = cache_size / block_size ;

    ll offset_len = log2( block_size );
    ll index_len = log2( num_block );
    ll tag_len = 32 - index_len - offset_len;

    vector<bool> valid(num_block,0);
    vector<string> cache(num_block);    

    while(fin >> addr ){

        total_num++;
        if( addr.length() < 8 ){
            while( addr.length() < 8 ){
                addr = '0' + addr;
            }
        }
        string bin_addr;
        for (ll i=0;i<addr.length();i++){
            bin_addr += h2b (addr[i]);

        }
        string bin_tag = bin_addr.substr(0,tag_len);
        int index = b2d( bin_addr.substr( tag_len, index_len ) );


        if(valid[index] && cache[index] == bin_tag  ){
            
            hit_num ++;

        }else if(valid[index] && cache[index] != bin_tag){
            
            cache[index] = bin_tag;

        }else if(!valid[index]){
            
            cache[index] = bin_tag;
            valid[index] = true;
            
        }





    }



    return (float)hit_num/total_num;
}

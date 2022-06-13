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




float direct_mapped(string filename, int block_size, int cache_size)
{
    int total_num = 0;
    int hit_num = 0;
    
    /*write your code HERE*/
    ifstream fin;
    fin.open(filename);
    

    
    string addr;
    int num_block = cache_size / block_size ;

    int offset_len = log2( block_size );
    int index_len = log2( num_block );
    int tag_len = 32 - log2( block_size ) - log2( num_block );

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
        for (ll i=0;i < addr.length();i++){
            bin_addr += h2b (addr[i]);

        }
        string bin_tag = bin_addr.substr(0,tag_len);
        int index = b2d( bin_addr.substr( tag_len, index_len ) );


        if(valid[index] && cache[index] == bin_tag  ){
            
            hit_num ++;

        }else {
            
            cache[index] = bin_tag;
            valid[index] = true;
            
        }





    }


    fin.close();
    return (float)hit_num/total_num;
}

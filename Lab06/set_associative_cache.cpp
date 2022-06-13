#include "set_associative_cache.h"
#include "string"   
#include<vector>
#include<iostream>
#include<fstream>
#include<cmath>
#include<queue>
#include<set>

#include "extra.h"
#define ll long long
using namespace std;








float set_associative(string filename, int way, int block_size, int cache_size)
{
    int total_num = 0;
    int hit_num = 0;

    /*write your code HERE*/
    
    ifstream fin;
    fin.open(filename);
    

    
    string addr;
    ll num_block = cache_size / block_size ;
    ll num_row = num_block / way;
    ll offset_len = log2( block_size );
    ll index_len = log2( num_block );
    ll tag_len = 32 - log2(num_row) - offset_len;

    
    vector< vector<bool> > valid( num_row, (vector<bool>(way,0)));
    vector< vector<string> > cache(num_row,(vector<string> (way,""))); 
    vector<queue<string>> used_order(num_row);

    while( fin >> addr ){
        total_num ++;
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
        int index = b2d( bin_addr.substr( tag_len, log2(num_row) ) );
        bool beenput = false;

        for(ll i=0;i < way;i++){
            
            if(valid[index][i] && cache[index][i] == bin_tag){
                beenput = true;
                hit_num ++;
                break;
            }
            else if( !valid[index][i] ){
                valid[index][i] = true;
                beenput = true;
                cache[index][i] = bin_tag;
                used_order[index].push(bin_tag);
                break;

            }

        }
        

        if(!beenput){
            string out = used_order[index].front();
            for(ll i=0;i<way;i++){
                if( cache[index][i] == out ){
                    cache[index][i] = bin_tag;
                    used_order[index].pop();
                    used_order[index].push(bin_tag);
                    break;
                }
            }



        }


    }



    return (float)hit_num/total_num;
}
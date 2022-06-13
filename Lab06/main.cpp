#include "direct_mapped_cache.h"
#include "set_associative_cache.h"
#include<iostream>
#include <iomanip>

using namespace std;

int main(int argc,char *argv[])
{
    string file = "testcase.txt";
    int direct_map_cache_list[4] = {4096, 16384, 65536, 262144};
    int direct_map_block_list[5] = {16, 32, 64, 128, 256};
    float direct_map_hit_ratio[4][5] = {0};


    /* compute and record direct_mapped results */
    cout<<"============================ Direct mapped result ============================"<<"\n\n";
    for(int cache_idx=0; cache_idx<4; cache_idx++)
    {
        for(int block_idx=0; block_idx<5; block_idx++)
        {
            //cout<<"Cache size: "<< direct_map_cache_list[cache_idx] << endl;
            //cout<<"Block size: "<< direct_map_block_list[block_idx] << endl;  
            direct_map_hit_ratio[cache_idx][block_idx] = direct_mapped(file, direct_map_block_list[block_idx], direct_map_cache_list[cache_idx]);
        }
    }

    /*print results*/
    for(int cache_idx=0; cache_idx<4; cache_idx++)
    {
        for(int block_idx=0; block_idx<5; block_idx++)
        {
            /*print miss ratio*/
            cout<<setw(10)<< 1-direct_map_hit_ratio[cache_idx][block_idx]<<" ";
        }
        cout<<"| "<<direct_map_cache_list[cache_idx]<<"\n";
    }
    cout<<string( 5 * 11, '-' )<<"\n";
    for (int block_idx=0; block_idx<5; block_idx++) cout<<setw(10)<<direct_map_block_list[block_idx]<<" ";
    cout<<"\n\n";

    int set_ass_cache_list[6] = {1024, 2048, 4096, 8192, 16384, 32768};
    int set_ass_way_list[4] = {1, 2, 4, 8};
    int set_ass_Block_size = 64;
    float set_ass_hit_ratio[6][4] = {0};

    cout<<"===================== N-way set associative result ======================="<<"\n\n"<<"Bloack size: "<<set_ass_Block_size<<"\n\n";
    /* compute and record LRU set_associative results */
    for(int cache_idx=0; cache_idx<6; cache_idx++)
    {
        for(int way_ldx=0; way_ldx<4; way_ldx++)
        {     
            //cout<<"Cache size: "<< set_ass_cache_list[cache_idx] << endl;
            //cout<< set_ass_way_list[way_ldx] << "-way" <<endl;
            set_ass_hit_ratio[cache_idx][way_ldx] = set_associative(file, set_ass_way_list[way_ldx], set_ass_Block_size, set_ass_cache_list[cache_idx]);
        }
    }

    /* print results */
    for(int cache_idx=0; cache_idx<6; cache_idx++)
    {
        for(int way_ldx=0; way_ldx<4; way_ldx++)
        {
            /*print miss ratio*/
            cout<<setw(10)<< 1-set_ass_hit_ratio[cache_idx][way_ldx]<<" ";
        }
        cout<<"| "<<set_ass_cache_list[cache_idx]<<"\n";
    }
    cout<<string( 4 * 11, '-' )<<"\n";
    for (int way_ldx=0; way_ldx<4; way_ldx++) cout<<setw(6)<<set_ass_way_list[way_ldx]<<"-way ";
    cout<<"\n";

    return 0;
}


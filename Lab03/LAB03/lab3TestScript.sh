#! /bin/bash
rm -rf Lab3test
cp -r Lab3Code Lab3test
cd Lab3test
mkdir -p result
for ((i=1;i<=10;i++)); do
	sed -r -i -e "s/CO_test_data([0-9]+).txt/CO_test_data$i.txt/" Instr_Memory.v
	iverilog *.v -o test && ./test > /dev/null
	cp ./CO_Result.txt result/result_$i.txt 
done

score=0
# diff
for ((i=1;i<=10;i++)); do
	echo "*************** CASE $i ******************"
	if [ $(diff <(cat ../Lab3Answer/result_$i.txt) <(cat result/result_$i.txt) | wc -l ) -eq 0 ]
    then
        echo "Testcase $i PASS"
        score=$(($score+1))
    else
		echo "Case $i Answer : "
		cat ../Lab3Answer/result_$i.txt
		echo "------------------------------------------"
		echo "Your : "
		cat result/result_$i.txt
        echo "Testcase $i WRONG"
    fi
done
echo "=========================================="
echo "Total Score:$(($score*10))"




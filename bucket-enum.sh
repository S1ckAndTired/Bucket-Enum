#!/bin/bash

letters=("a" "A" "b" "B" "c" "C" "d" "D" "e" "E" "f" "F" "g" "G" "h" "H" "i" "I" "j" "J" "k" "K" "l" "L" "m" "M" "n" "N" "o" "O" "p" "P" "q" "Q" "r" "R" "s" "S" "t" "T" "u" "U" "v" "V" "w" "W" "x" "X" "y" "Y" "z" "Z")



if [[ -z "$1" ]];then
  echo "[-]You certainly forgot the bucket name!"
else
  first_dir=$(aws s3 ls s3://$1/$word --no-sign-request | grep "/$" | awk '{print $2}' | head -n 1)
  for word in "${letters[@]}"
  do
    base_directory=$(aws s3 ls s3://$1/$word --no-sign-request | grep "/$" | awk '{print $2}') 
    if [[ -z "$base_directory"  ]];then
      :
    else
      for base_dir in $(echo $base_directory)
      do
        down1=$(aws s3 ls s3://$1/$base_dir --no-sign-request | grep "/$" | awk '{print $2}')
        if [[ -z "$down1" ]];then
          echo "[$base_dir]"
        else
          echo "[$base_dir]"
          length_base_dir=${#first_dir}
          width=$(($length_base_dir/2))
          for dirs_of_down1 in $(echo $down1)
          do
            if [[ "$dirs_of_down1" != *$(echo "$down1" | tail -n 1)* ]];then
              printf "%${width}s├[$dirs_of_down1] \n"
            else
              printf "%${width}s├[$dirs_of_down1] \n"
            fi
            down2=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1 --no-sign-request | grep "/$" | awk '{print $2}')

            if [[ -z "$down2" ]];then
              :
            else
              for dirs_of_down2 in $(echo $down2)
              do
                dirs_of_down1_lengthed=${#dirs_of_down1}
                dirs_of_down1_lengthed_and_divided=$(($dirs_of_down1_lengthed/2))
                if [[ "$dirs_of_down2" != *$(echo "$down2" | tail -n 1)* ]];then
                  printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s├[$dirs_of_down2] \n"
                else
                  printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s└[$dirs_of_down2] \n"
                fi
                down3=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1$dirs_of_down2 --no-sign-request | grep "/$" | awk '{print $2}')
                if [[ -z "$down3" ]];then
                  :
                else
                  for dirs_of_down3 in $(echo $down3)
                  do
                    dirs_of_down2_lengthed=${#dirs_of_down2}
                    dirs_of_down2_lengthed_and_divided=$(($dirs_of_down2_lengthed/2))
                    if [[ "$dirs_of_down3" != *$(echo "$down3" | tail -n 1)* ]];then
                      printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s%${dirs_of_down2_lengthed_and_divided}s├[$dirs_of_down3] \n"
                    else
                      printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s%${dirs_of_down2_lengthed_and_divided}s└[$dirs_of_down3] \n"
                    fi
                    down4=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1$dirs_of_down2$dirs_of_down3  --no-sign-request | grep "/$" | awk '{print $2}')

                    if [[ -z "$down4" ]];then
                      :
                    else
                        for dirs_of_down4 in $(echo $down4)
                        do
                          dirs_of_down3_lengthed=${#dirs_of_down3}
                          dirs_of_down3_lengthed_and_divided=$(($dirs_of_down3_lengthed/2))
                          if [[ "$dirs_of_down4" != *$(echo "$down4" | tail -n 1)* ]];then
                            printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s%${dirs_of_down2_lengthed_and_divided}s%${dirs_of_down3_lengthed_and_divided}s├[$dirs_of_down4] \n"
                          else
                            printf "%${width}s│%${dirs_of_down1_lengthed_and_divided}s%${dirs_of_down2_lengthed_and_divided}s%${dirs_of_down3_lengthed_and_divided}s└[$dirs_of_down4] \n"
                          fi
                        done
                    fi
                  done
                fi
            done
            fi
          done
        fi
      done
    fi
  done
fi




letters=("a" "A" "b" "B" "c" "C" "d" "D" "e" "E" "f" "F" "g" "G" "h" "H" "i" "I" "j" "J" "k" "K" "l" "L" "m" "M" "n" "N" "o" "O" "p" "P" "q" "Q" "r" "R" "s" "S" "t" "T" "u" "U" "v" "V" "w" "W" "x" "X" "y" "Y" "z" "Z")



if [[ -z "$1" ]];then
  echo "[-]You certainly forgot the bucket name!"
else
  first_dir=$(aws s3 ls s3://$1/$word --no-sign-request | grep "/$" | awk '{print $2}' | head -n 1)
  for word in "${letters[@]}"
  do
    base_directory=$(aws s3 ls s3://$1/$word --no-sign-request | grep "/$" | awk '{print $2}') 
    if [[ -z "$base_directory"  ]];then
      :
    else
      for base_dir in $(echo $base_directory)
      do
        down1=$(aws s3 ls s3://$1/$base_dir --no-sign-request | grep "/$" | awk '{print $2}')
        if [[ -z "$down1" ]];then
          echo "─[$base_dir]"
        else
          echo "─[$base_dir]"
          length_base_dir=${#first_dir}
          volatile_width=$(($length_base_dir - $length_base_dir + 1))
          for dirs_of_down1 in $(echo $down1)
          do
            if [[ "$dirs_of_down1" != *$(echo "$down1" | tail -n 1)* ]];then
              printf "%${volatile_width}s├──[$dirs_of_down1] FIRST\n"
            else
              printf "%${volatile_width}s└──[$dirs_of_down1] SECOND\n"
            fi
            down2=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1 --no-sign-request | grep "/$" | awk '{print $2}')

            if [[ -z "$down2" ]];then
              :
            else
              for dirs_of_down2 in $(echo $down2)
              do
                #dirs_of_down2_lengthed=${#dirs_of_down2}
                #dirs_of_down1_lengthed_and_divided=$(($dirs_of_down1_lengthed -  $dirs_of_down1_lengthed + 1))
                dir2_tab_space="**"
                fixed_length_for_dir2=${#dir2_tab_space}
                length_dir2=$(($fixed_length_for_dir2))
                if [[ "$dirs_of_down2" != *$(echo "$down2" | tail -n 1)* ]];then
                  printf " │%${length_dir2}s├──[$dirs_of_down2] NEW1\n"
                else
                  printf " │%${length_dir2}s└──[$dirs_of_down2] NEW2\n"
                fi
                down3=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1$dirs_of_down2 --no-sign-request | grep "/$" | awk '{print $2}')
               if [[ -z "$down3" ]];then
                  :
                else
                  for dirs_of_down3 in $(echo $down3)
                  do
                    dir3_tab_space="***"
                    fixed_length_for_dir3=${#dir3_tab_space}
                    length_dir3=$(($fixed_length_for_dir3))
                    if [[ "$dirs_of_down3" != *$(echo "$down3" | tail -n 1)* ]];then
                      printf " │  │  ├──[$dirs_of_down3] AQUI!\n"
                    else
                      printf " │  │  └──[$dirs_of_down3] AQUI?\n"
                    fi
                    down4=$(aws s3 ls s3://$1/$base_dir$dirs_of_down1$dirs_of_down2$dirs_of_down3  --no-sign-request | grep "/$" | awk '{print $2}')

                    if [[ -z "$down4" ]];then
                      :
                    else
                        for dirs_of_down4 in $(echo $down4)
                        do
                          if [[ "$dirs_of_down4" != *$(echo "$down4" | tail -n 1)* ]];then
                            printf " │  │  │  ├──[$dirs_of_down4] IMAGE\n"
                          else
                            printf " │  │     └──[$dirs_of_down4] \n"
                          fi
                        done
                    fi
                  done
                fi
            done
            fi
          done
        fi
      done
    fi
  done
fi 

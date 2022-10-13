#Mac address changer script By Sandeep Singh(gu-2021-4204) and Mohitpal Singh(gu-2021-4181) 
#MacAddresses=("fc:08:77:b2:c0:8e","fc:22:9c:00:09:7c","fc:17:94:08:00:46","f8:e4:fb:00:07:0e","f8:e4:fb:00:00:8f")

if [[ $EUID -ne 0 ]]
then
  printf "${ERROR}Use mchanger as root: sudo macchanger [interface] [new_mac_address]\n"
  exit 1
fi

echo "Current mac addres : $(ifconfig $1 | grep "ether" | awk '{print$2}')"
sudo ifconfig $1 down
sudo ifconfig $1 hw ether $2
sudo ifconfig $1 up
echo "new mac addres : $(ifconfig $1 | grep "ether" | awk '{print$2}')"
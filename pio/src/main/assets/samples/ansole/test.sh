#!/system/bin/sh

const="********************************************"

echo "测试在 ansole 里运行脚本"
echo "$const"
echo -e "\n\n"
echo "设备信息："

getprop ro.product.system.brand
getprop ro.product.system.device
getprop ro.product.system.manufacturer
getprop ro.product.system.marketname
getprop ro.product.system.model
getprop ro.product.system.name

echo -e "\n\n"
echo "$const"
echo -e "\n\n"
echo "当前用户：$(id)"
echo -e "\n\n"
echo "$const"
su


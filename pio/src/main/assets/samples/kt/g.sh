#!/system/bin/sh

# $1 method
# $2 clusterIndex
# $3 value

method=$1
cluster_index=$2
value=$3

if [ "$method" = "" ] || [ "$cluster_index" = "" ]; then
    return
fi

load_cluster() 
{
    cluster_path=$(cat "cluster$cluster_index")
}

# 获取可用的调度器
governors()
{
    if [ ! -f governors.cache ]; then
        load_cluster
        for item in $(cat "$cluster_path/scaling_available_governors"); do
            echo "$item" >> governors.cache
        done
    fi
    cat governors.cache
}

# 获取cpu使用的调度器
get_governor()
{
    load_cluster
    cat "$cluster_path/scaling_governor"
}

# 设置cpu使用的调度器
set_governor() 
{
    load_cluster
    echo "$value" > "$cluster_path/scaling_governor"
}

$method





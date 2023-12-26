#!/usr/bin/env bash

# 获取当前的外观模式
get_appearance_mode() {
    osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode'
}

# 初始化上一个模式为空
previous_mode=""

# 无限循环，定期检查外观模式
while true; do
    current_mode=$(get_appearance_mode)

    # 如果当前模式与上一个模式不同，则执行操作
    if [ "$current_mode" != "$previous_mode" ]; then
        if [ "$current_mode" == "true" ]; then
            echo "Switched to Dark Mode"
            ./switch-theme.sh dark
        else
            echo "Switched to Light Mode"
            ./switch-theme.sh light
        fi
        # 更新上一个模式
        previous_mode=$current_mode
    fi

    sleep 10 # 每10秒检查一次
done


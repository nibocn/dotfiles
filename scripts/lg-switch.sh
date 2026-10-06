#!/bin/bash

set -u

DISPLAY_NAME="LG ULTRAGEAR"
STATE_FILE="$HOME/.lg-display-mode"

# LG Alternate DDC input values
INPUT_MAC="0xD0"      # DisplayPort 1
INPUT_PS4="0x90"      # HDMI 1
INPUT_SWITCH="0x91"   # HDMI 2

# macOS audio output device names
AUDIO_MAC="LG ULTRAGEAR"
AUDIO_OTHER="LG HDR 4K"

# --------------------------------------------------
# Find betterdisplaycli
# --------------------------------------------------

find_cli() {
    if command -v betterdisplaycli >/dev/null 2>&1; then
        command -v betterdisplaycli
        return 0
    fi

    if [ -x "/opt/homebrew/bin/betterdisplaycli" ]; then
        echo "/opt/homebrew/bin/betterdisplaycli"
        return 0
    fi

    if [ -x "/usr/local/bin/betterdisplaycli" ]; then
        echo "/usr/local/bin/betterdisplaycli"
        return 0
    fi

    return 1
}

CLI="$(find_cli)" || {
    echo "错误：找不到 betterdisplaycli"
    echo "请确认 BetterDisplay CLI 已安装并可执行。"
    exit 1
}

find_audio_cli() {
    if command -v SwitchAudioSource >/dev/null 2>&1; then
        command -v SwitchAudioSource
        return 0
    fi

    if [ -x "/opt/homebrew/bin/SwitchAudioSource" ]; then
        echo "/opt/homebrew/bin/SwitchAudioSource"
        return 0
    fi

    if [ -x "/usr/local/bin/SwitchAudioSource" ]; then
        echo "/usr/local/bin/SwitchAudioSource"
        return 0
    fi

    return 1
}

AUDIO_CLI="$(find_audio_cli)" || {
    echo "错误：找不到 SwitchAudioSource"
    echo "请先安装：brew install switchaudio-osx"
    exit 1
}

# --------------------------------------------------
# Helpers
# --------------------------------------------------

save_state() {
    printf '%s\n' "$1" > "$STATE_FILE"
}

get_saved_state() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo "mac"
    fi
}

connect_lg() {
    "$CLI" set \
        -namelike="$DISPLAY_NAME" \
        -connected=on
}

disconnect_lg() {
    "$CLI" set \
        -namelike="$DISPLAY_NAME" \
        -connected=off
}

set_input() {
    local input="$1"

    "$CLI" set \
        -namelike="$DISPLAY_NAME" \
        -ddcAlt="$input" \
        -vcp=inputSelectAlt
}

set_audio_output() {
    local device="$1"

    "$AUDIO_CLI" -s "$device" -t output >/dev/null || {
        echo "错误：无法把 macOS 音频输出切换到：$device"
        return 1
    }

    echo "✓ 音频输出：$device"
}

# --------------------------------------------------
# Modes
# --------------------------------------------------

switch_to_mac() {
    echo "正在切换：Mac"

    # The LG may currently be soft-disconnected.
    # Reconnect first so the DP/DDC path can become available again.
    connect_lg || {
        echo "错误：无法恢复 LG 显示器连接"
        return 1
    }

    sleep 2

    set_input "$INPUT_MAC" || {
        echo "错误：无法切换 LG 到 DisplayPort"
        return 1
    }

    sleep 1

    set_audio_output "$AUDIO_MAC" || {
        return 1
    }

    save_state "mac"
    echo "✓ 已切换到 Mac / DisplayPort"
}

switch_to_ps4() {
    echo "正在切换：PS4"

    # Ensure DDC is available before changing input.
    connect_lg || {
        echo "错误：无法恢复 LG 显示器连接"
        return 1
    }

    sleep 1

    set_input "$INPUT_PS4" || {
        echo "错误：无法切换 LG 到 HDMI 1"
        return 1
    }

    sleep 1

    set_audio_output "$AUDIO_OTHER" || {
        return 1
    }

    sleep 1

    disconnect_lg || {
        echo "错误：LG 已切到 PS4，但无法从 macOS 中断开"
        return 1
    }

    save_state "ps4"
    echo "✓ 已切换到 PS4 / HDMI 1"
}

switch_to_switch() {
    echo "正在切换：Nintendo Switch"

    # Ensure DDC is available before changing input.
    connect_lg || {
        echo "错误：无法恢复 LG 显示器连接"
        return 1
    }

    sleep 1

    set_input "$INPUT_SWITCH" || {
        echo "错误：无法切换 LG 到 HDMI 2"
        return 1
    }

    sleep 1

    set_audio_output "$AUDIO_OTHER" || {
        return 1
    }

    sleep 1

    disconnect_lg || {
        echo "错误：LG 已切到 Switch，但无法从 macOS 中断开"
        return 1
    }

    save_state "switch"
    echo "✓ 已切换到 Nintendo Switch / HDMI 2"
}

switch_next() {
    local current
    current="$(get_saved_state)"

    case "$current" in
        mac)
            switch_to_ps4
            ;;
        ps4)
            switch_to_switch
            ;;
        switch)
            switch_to_mac
            ;;
        *)
            echo "检测到未知状态：$current"
            echo "将状态重置并切换到 Mac。"
            switch_to_mac
            ;;
    esac
}

show_status() {
    echo "保存的模式：$(get_saved_state)"
    echo "状态文件：$STATE_FILE"
}

show_usage() {
    cat <<EOF
用法：
  $0 mac       切换到 Mac / DisplayPort
  $0 ps4       切换到 PS4 / HDMI 1
  $0 switch    切换到 Nintendo Switch / HDMI 2
  $0 next      循环切换：Mac -> PS4 -> Switch -> Mac
  $0 status    显示脚本保存的当前模式

不带参数时默认执行 next。
EOF
}

# --------------------------------------------------
# Entry
# --------------------------------------------------

MODE="${1:-next}"

case "$MODE" in
    mac)
        switch_to_mac
        ;;
    ps4)
        switch_to_ps4
        ;;
    switch)
        switch_to_switch
        ;;
    next)
        switch_next
        ;;
    status)
        show_status
        ;;
    -h|--help|help)
        show_usage
        ;;
    *)
        echo "错误：未知模式 '$MODE'"
        echo
        show_usage
        exit 1
        ;;
esac



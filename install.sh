#!/bin/bash

# Fungsi untuk menampilkan animasi loading
loading_animation() {
    local dots="."
    while true; do
        for i in {1..3}; do
            printf "\rLoading%s" "$(printf "%${i}s" | tr ' ' '.')"
            sleep 0.5
        done
    done
}

# Menjalankan animasi loading di background
loading_animation &

# Menyimpan PID dari proses animasi loading
loading_pid=$!

# Menginstal paket yang diperlukan
install_packages() {
    pkg install python -y > /dev/null 2>&1
    pkg install git -y > /dev/null 2>&1
    pkg install bash -y > /dev/null 2>&1
}

# Menginstal Python packages
install_python_packages() {
    pip install cryptography > /dev/null 2>&1
    pip install --upgrade pip setuptools wheel > /dev/null 2>&1
    pip install cryptography --only-binary :all: > /dev/null 2>&1
}

# Menjalankan script Python
run_python_script() {
    python RosaGhosh.py
}

# Main function
main() {
    install_packages
    install_python_packages
    kill $loading_pid  # Menghentikan animasi loading
    run_python_script
}

# Menjalankan script utama
main
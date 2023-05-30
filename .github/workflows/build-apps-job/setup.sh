#! /usr/bin/bash
echo ========================================
echo ========================================
echo Applications will be tested by trying to
echo build each one of them. 
echo ========================================
echo ========================================

# Create the virtual environment and install the requirements. 
make venv
. .venv/bin/activate

echo ========================================
echo ========================================
echo Some previous configurations...
echo ========================================
echo ========================================

# The variable could also be obtained from the container.
export RISCV='/home/root/tools/riscv' &&\

# The MCU is generated with various memory banks to avoid example code not fitting. 	
make mcu-gen MEMORY_BANKS=6

echo ========================================
echo ========================================
echo Starting building script
echo ========================================
echo ========================================

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod u+x $SCRIPT_DIR/build-apps.sh
$SCRIPT_DIR/build-apps.sh

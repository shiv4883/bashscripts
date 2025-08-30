#!/bin/bash
# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_xml_file>"
    exit 1
fi
INPUT_FILE=$1
OUTPUT_FILE="users.csv"
# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found!"
    exit 1
fi
# Check if xmlstarlet is installed
if ! command -v xmlstarlet &> /dev/null; then
    echo "Error: xmlstarlet is not installed. Please install it first."
    echo "You can install it using: sudo apt-get install xmlstarlet (Ubuntu/Debian)"
    echo "or: sudo yum install xmlstarlet (RHEL/CentOS)"
    exit 1
fi
# Create CSV header
echo "ID,UserKey,LowerUserName" > "$OUTPUT_FILE"
# Parse XML and create CSV
xmlstarlet sel -t \
    -m "//ApplicationUser" \
    -v "concat(@id,',',@userKey,',',@lowerUserName)" \
    -n \
    "$INPUT_FILE" >> "$OUTPUT_FILE"
echo "CSV file has been created as $OUTPUT_FILE"
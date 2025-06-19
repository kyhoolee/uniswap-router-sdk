#!/bin/bash

# Di chuyển vào thư mục chứa script
cd "$(dirname "$0")"

# Đặt lại đường dẫn gốc về project
ROOT_DIR="../"

# Tên file output
OUTPUT_FILE="combined_router_sdk.txt"

# Xóa file cũ nếu đã tồn tại
rm -f "$OUTPUT_FILE"

# Gom toàn bộ file *.ts từ src/ và subfolders
find "$ROOT_DIR/src" -type f -name "*.ts" ! -name "*.test.ts" | sort | while read filepath; do
    echo "--------------------" >> "$OUTPUT_FILE"
    echo "// FILE: ${filepath#$ROOT_DIR}" >> "$OUTPUT_FILE"
    echo "--------------------" >> "$OUTPUT_FILE"
    cat "$filepath" >> "$OUTPUT_FILE"
    echo -e "\n\n" >> "$OUTPUT_FILE"
done

echo "✅ Đã tạo xong file: $OUTPUT_FILE"

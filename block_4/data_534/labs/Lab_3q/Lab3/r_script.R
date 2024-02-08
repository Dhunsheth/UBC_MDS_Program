file_path <- "text.txt"

file_content <- readChar(file_path, file.info(file_path)$size)

print(file_content)


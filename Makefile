BUILD_DIR = build

all: $(BUILD_DIR)/asm-bot

$(BUILD_DIR)/asm-bot: $(BUILD_DIR)/main.o
	ld -o $(BUILD_DIR)/asm_app $(BUILD_DIR)/main.o

$(BUILD_DIR)/main.o: cmd/main.asm | $(BUILD_DIR)
	nasm -f elf64 cmd/main.asm -o $(BUILD_DIR)/main.o

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

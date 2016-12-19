CC = clang++
LLVMFLAGS = 
CFLAGS = -g -Wall -Wextra -O3 -rdynamic
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs core orcjit native`
TARGET = lang

all: $(TARGET)

$(TARGET): clean
	# Curse you __FILE__
	cd src && $(CC) -o ../$(TARGET) *.cpp $(CFLAGS) $(LLVMFLAGS)

clean:
	rm -f *.a *.o *.la *.lo *.so *.so.* *.out $(TARGET)

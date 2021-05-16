CXX= g++
CXXFLAGS = -std=c++14 -Wall -MMD -g 
SOURCES = $(filter-out controller_test_1.cpp, $(wildcard *.cpp)) # list of all .cpp files in the current directory
#SOURCES = $(filter-out main.cpp, $(wildcard *.cpp))
OBJECTS = $(SOURCES:.cpp=.o)  # .o files depend upon .cpp files with same names
DEPENDS = $(OBJECTS:.o=.d)   # .d file is list of dependencies for corresponding .cpp file
EXEC = run.app

$(EXEC): $(OBJECTS)
	$(CXX) $(OBJECTS) $(CXXFLAGS) -o $(EXEC)

-include $(DEPENDS)

.PHONY: clean

clean:
	rm $(EXEC) $(OBJECTS) $(DEPENDS)

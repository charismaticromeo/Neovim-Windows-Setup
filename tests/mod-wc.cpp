// Reimplementation of the wc command with cpp
#include <cctype>
#include <cstddef>
#include <exception>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

struct Counts {
  std::size_t lines = 0;
  std::size_t words = 0;
  std::size_t bytes = 0;
};

bool isWordBoundary(char c) {
  return std::isspace(static_cast<unsigned char>(c));
}

Counts countStream(std::istream &input) {
  Counts counts;
  char ch;
  bool inWord = false;

  while (input.get(ch)) {
    counts.bytes++;

    if (ch == '\n') {
      counts.lines++;
    }

    if (isWordBoundary(ch)) {
      inWord = false;
    } else if (!inWord) {
      inWord = true;
      counts.words++;
    }
  }

  return counts;
}

Counts countFile(const std::string &filename) {
  std::ifstream file(filename, std::ios::binary);
  if (!file) {
    throw std::runtime_error("wc: cannot open file '" + filename + "'");
  }
  return countStream(file);
}

void printCounts(const Counts &c, const std::string &label, bool showLines,
                 bool showWords, bool showBytes) {
  if (showLines) {
    std::cout << c.lines << " ";
  }
  if (showWords) {
    std::cout << c.words << " ";
  }
  if (showBytes) {
    std::cout << c.bytes << " ";
  }
  std::cout << label << "\n";
}

int main(int argc, char *argv[]) {
  bool showLines = false;
  bool showWords = false;
  bool showBytes = false;

  std::vector<std::string> files;

  // Parse arguments
  for (int i = 1; i < argc; ++i) {

    std::string arg = argv[i];
    if (arg == "-l")
      showLines = true;
    else if (arg == "-w")
      showWords = true;
    else if (arg == "-c")
      showBytes = true;
    else
      files.push_back(arg);
  }

  // Default behavior: show all
  if (!showLines && !showWords && !showBytes) {

    showLines = showWords = showBytes = true;
  }

  Counts total;

  try {
    if (files.empty()) {
      Counts c = countStream(std::cin);
      printCounts(c, "", showLines, showWords, showBytes);
      return 0;
    }

    for (const auto &file : files) {
      Counts c = countFile(file);

      total.lines += c.lines;
      total.words += c.words;
      total.bytes += c.bytes;

      printCounts(c, file, showLines, showWords, showBytes);
    }

    if (files.size() > 1) {
      printCounts(total, "total", showLines, showWords, showBytes);
    }

  } catch (const std::exception &ex) {
    std::cerr << ex.what() << "\n";
    return 1;
  }

  return 0;
}

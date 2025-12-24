#include <iostream>
#include <string>

std::string greet(const std::string &name) { return "Hello, " + name + "!"; }

int main(int argc, char *argv[]) {
  std::cout << greet("C++ World") << std::endl;
  return 0;
}

/* TO COMPILE ON POWERSHELL
 *
 * g++ test.cpp -o testcpp; if($?) { .\testcpp.exe }
 *
 * */

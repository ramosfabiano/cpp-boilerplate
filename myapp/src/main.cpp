#include "MyClass.hpp"
#include <iostream>

auto
main (int argc, const char **argv) -> int
{
  MyClass myClass;
  std::cout << "Hello World! "
            << "Method1: " << myClass.Method1 ()
            << " Method2: " << (myClass.Method2 () ? "True" : "False")
            << std::endl;
  return 0;
}

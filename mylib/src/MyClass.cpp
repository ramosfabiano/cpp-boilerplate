#include "MyClass.hpp"
#include <boost/filesystem.hpp>
#include <boost/random.hpp>

auto
MyClass::Method1 (float v) -> float
{
  return v + 4.15f;
}

auto
MyClass::Method2 () -> bool
{
  return boost::filesystem::exists ("/etc/os-release");
}

auto
MyClass::Method3 () -> int
{
  boost::random::mt19937 rng; // produces randomness out of thin air
                              // see pseudo-random number generators
  boost::random::uniform_int_distribution<> six (1, 6);
  // distribution that maps to 1..6
  // see random number distributions
  return six (rng); // simulate rolling a die
}

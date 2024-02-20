#include "MyClass.hpp"

#include <boost/filesystem.hpp>
#include <boost/random.hpp>

auto MyClass::Method1(float v) -> float {
    constexpr float magicValue = 4.15f;
    return v + magicValue;
}

auto MyClass::Method2() -> bool { return boost::filesystem::exists("/etc/os-release"); }

auto MyClass::Method3() -> int {
    // simulate rolling a die
    constexpr int minVal{1}, maxVal{6};
    boost::random::mt19937 rng;
    boost::random::uniform_int_distribution<> six(minVal, maxVal);
    return six(rng);
}

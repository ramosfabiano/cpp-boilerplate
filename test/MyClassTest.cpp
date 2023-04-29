#include "MyClass.hpp"
#include "gtest/gtest.h"

class MyClassTest : public ::testing::Test
{
protected:
    MyClass testedObject;
};

// Test the Method1 method.
TEST_F (MyClassTest, TestMethod1)
{

    EXPECT_FLOAT_EQ (testedObject.Method1 (), 4.15f);
}

// Test the CalculateHValue method.
TEST_F (MyClassTest, TestMethod2)
{
    ASSERT_NE (testedObject.Method2 (), false);
}

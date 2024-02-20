#include "MyClass.hpp"
#include "gtest/gtest.h"

class MyClassTest : public ::testing::Test {
   protected:
    MyClass testedObject;
};

TEST_F(MyClassTest, TestMethod1) { EXPECT_FLOAT_EQ(testedObject.Method1(), 4.15f); }

TEST_F(MyClassTest, TestMethod2) { ASSERT_NE(testedObject.Method2(), false); }

TEST_F(MyClassTest, TestMethod3) {
    auto rc = testedObject.Method3();
    ASSERT_GE(rc, 1);
    ASSERT_LE(rc, 6);
}

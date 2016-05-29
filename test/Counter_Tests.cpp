/*
 * Counter_Tests.cpp
 *
 *  Created on: Mar 14, 2016
 *      Author:
 */

#include "gtest/gtest.h"
#include "Counter.hpp"

TEST(Counter, Increment) {
      Counter c;
      EXPECT_EQ(0, c.Increment());
      EXPECT_EQ(1, c.Increment());
      EXPECT_EQ(2, c.Increment());
}



#include "gtest/gtest.h"

double SquareRoot (double x){
	return 0;
}

TEST (SquareRootTests, PositiveNos) {
    EXPECT_EQ (18.0, SquareRoot(324.0));
    EXPECT_EQ (25.4, SquareRoot(645.16));
    EXPECT_EQ (50.332, SquareRoot(2533.310224));
}

TEST (SquareRootTests, ZeroAndNegativeNos) {
    ASSERT_EQ (2.0, SquareRoot(4.0));
    ASSERT_EQ (4.0, SquareRoot(16.0));
}

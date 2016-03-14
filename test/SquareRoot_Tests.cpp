#include <gtest/gtest.h>

double SquareRoot (double x){
	return 0;
}

TEST (SquareRootTest, PositiveNos) {
    EXPECT_EQ (18.0, SquareRoot(324.0));
    EXPECT_EQ (25.4, SquareRoot(645.16));
    EXPECT_EQ (50.3321, SquareRoot(2533.310224));
}

TEST (SquareRootTest, ZeroAndNegativeNos) {
    ASSERT_EQ (0.0, SquareRoot(0.0));
    ASSERT_EQ (-1, SquareRoot(-22.0));
}

/*
 * Counter.h
 *
 *  Created on: Mar 14, 2016
 *      Author: asma
 */

/**
 * @file Counter.hpp
 * @author Me
 * @date 9 Mar 2016
 * @brief File containing example of doxygen usage for quick reference.
 *
 * Here typically goes a more extensive explanation of what the header
 * defines. Doxygens tags are words preceeded by either a backslash @\
 * or by an at symbol @@.
 * @see http://www.stack.nl/~dimitri/doxygen/docblocks.html
 * @see http://www.stack.nl/~dimitri/doxygen/commands.html
 */

#ifndef COUNTER_HPP_
#define COUNTER_HPP_



class Counter {
private:
      int mCounter;
public:
      Counter() : mCounter(0) {}
      int Increment();
};

#endif /* COUNTER_HPP_ */

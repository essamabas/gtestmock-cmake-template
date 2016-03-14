/*
 * Counter.h
 *
 *  Created on: Mar 14, 2016
 *      Author: asma
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

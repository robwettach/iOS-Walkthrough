//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Rob Wettach on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = m_operandStack;

- (NSMutableArray *)operandStack
{
    if (!m_operandStack)
    {
        m_operandStack = [[NSMutableArray alloc] init];
    }
    return m_operandStack;
}

- (void)pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand
{
    NSNumber *operand = [self.operandStack lastObject];
    if (operand)
    {
        [self.operandStack removeLastObject];
    }
    return [operand doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    else if ([@"*" isEqualToString:operation])
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([@"-" isEqualToString:operation])
    {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    }
    else if ([@"/" isEqualToString:operation])
    {
        double divisor = [self popOperand];
        if (divisor)
        {
            result = [self popOperand] / divisor;
        }
    }
    
    [self pushOperand:result];
    
    return result;
}

@end

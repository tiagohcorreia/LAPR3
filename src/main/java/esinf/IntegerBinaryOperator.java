package esinf;

import java.util.function.BinaryOperator;

/**
 * The type Integer binary operator.
 */
public class IntegerBinaryOperator implements BinaryOperator<Integer> {

    @Override
    public Integer apply(Integer integer, Integer integer2) {
        return integer + integer2;
    }
}

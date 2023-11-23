package esinf;

import java.util.function.BinaryOperator;

public class IntegerBinaryOperator implements BinaryOperator<Integer> {

    @Override
    public Integer apply(Integer integer, Integer integer2) {
        return integer + integer2;
    }
}

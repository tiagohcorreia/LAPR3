package esinf.us_ei06;

import esinf.model.Hub;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.function.BinaryOperator;

class PossibleRoutesCalculatorTest {

    GraphStore graphStore=new GraphStore();
    BinaryOperator<Integer> operator=new IntegerBinaryOperator();
    Comparator<Integer> comparator=new IntegerComparator();

    @BeforeEach
    void setUp() {
        graphStore.clean();

    }

    boolean replaceSimpleLocalsByHubs(ArrayList<Local> simpleLocals,
                                   ArrayList<Hub> hubs){
        if (simpleLocals.size()!=hubs.size()){
            return false;
        }

        for (int i=0; i< simpleLocals.size(); i++){
            Local simpleLocal=simpleLocals.get(i);
            Local hub=hubs.get(i);
            graphStore.replaceLocal(simpleLocal, hub);
        }

        return true;
    }

    public void testRoutesWithinAutonomy(){

    }

}
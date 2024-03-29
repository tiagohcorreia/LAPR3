package esinf;

import java.util.*;

/**
 * The type Algorithms alternative.
 */
public class AlgorithmsAlternative extends Algorithms {
    /**
     * Gets path.
     *
     * @param <V>      the type parameter
     * @param <E>      the type parameter
     * @param g        the g
     * @param vOrig    the v orig
     * @param vDest    the v dest
     * @param pathKeys the path keys
     * @param path     the path
     */
    public static <V, E> void getPath(Graph<V, E> g, V vOrig, V vDest, List<V> pathKeys, List<V> path) {
        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return;

        if (vOrig.equals(vDest)) {
            path.add(vOrig);
            return;
        }

        int vDestKey = g.key(vDest);

        // Build the path iteratively
        while (vDestKey != -1) {
            V vertex = g.vertex(vDestKey);
            path.add(vertex);
            vDestKey = g.key(pathKeys.get(vDestKey));
        }

        Collections.reverse(path);
    }


    /**
     * Clean.
     *
     * @param <V>    the type parameter
     * @param source the source
     * @param v      the v
     */
    public static <V> void clean(LinkedList<V> source, V v) {
        LinkedList<V> destination = new LinkedList<>();
        for (V element : source) {
            if (!destination.contains(element)) {
                destination.add(element);
            }
        }

    }

    /**
     * Remove elements after.
     *
     * @param <V>    the type parameter
     * @param list   the list
     * @param target the target
     */
    public static <V> void removeElementsAfter(LinkedList<V> list, V target) {
        if (list == null || target == null || list.isEmpty()) {
            return; // Handle null or empty list
        }

        int index = list.indexOf(target);

        if (index != -1) {
            // If the target element is found, remove all elements that come after it
            list.subList(index + 1, list.size()).clear();
        }
    }

    /**
     * Remove duplicates.
     *
     * @param <V>  the type parameter
     * @param list the list
     */
    public static <V> void removeDuplicates(LinkedList<V> list) {
        Set<V> uniqueElements = new HashSet<>();
        LinkedList<V> result = new LinkedList<>();

        for (V element : list) {
            if (uniqueElements.add(element)) {
                // If the element is not already in the set, add it to the result list
                result.add(element);
            }
        }  // Clear the original list and add the unique elements
        list.clear();
        list.addAll(result);
    }

}

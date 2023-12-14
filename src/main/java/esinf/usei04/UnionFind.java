package esinf.usei04;

import java.util.HashMap;
import java.util.Map;

public class UnionFind<T> {

    private Map<T, T> parent;

    public UnionFind(Iterable<T> elements) {
        parent = new HashMap<>();
        for (T element : elements) {
            parent.put(element, element);
        }
    }

    public T find(T element) {
        if (!parent.containsKey(element)) {
            return null; // Element not present in the Union-Find structure
        }

        T root = element;
        while (!root.equals(parent.get(root))) {
            root = parent.get(root);
        }

        // Path compression
        while (!element.equals(root)) {
            T next = parent.get(element);
            parent.put(element, root);
            element = next;
        }

        return root;
    }

    public void union(T element1, T element2) {
        T root1 = find(element1);
        T root2 = find(element2);

        if (root1 == null || root2 == null || root1.equals(root2)) {
            return; // Elements are already in the same set or not present
        }

        parent.put(root1, root2);
    }
}



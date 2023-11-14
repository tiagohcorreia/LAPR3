package ui.utils;

import java.util.Objects;

public class MenuItem {

    private final String description;
    private final Runnable ui;

    /**
     * Instantiates a new Menu item.
     *
     * @param description the description
     * @param ui          the ui
     */
    public MenuItem(String description, Runnable ui) {

        /*if (StringUtils.isBlank(description)) {
            throw new IllegalArgumentException("MenuItem description cannot be null or empty.");
        }*/

        if (Objects.isNull(ui)) {
            throw new IllegalArgumentException("MenuItem does not support a null UI.");
        }

        this.description = description;
        this.ui = ui;
    }

    /**
     * Run.
     */
    public void run() {
        this.ui.run();
    }

    /**
     * Has description boolean.
     *
     * @param description the description
     * @return the boolean
     */
    public boolean hasDescription(String description) {
        return this.description.equals(description);
    }

    public String toString() {
        return this.description;
    }
}

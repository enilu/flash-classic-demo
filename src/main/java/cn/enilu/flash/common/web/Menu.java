package cn.enilu.flash.common.web;

import java.util.*;

public class Menu {
    public static class MenuItem {
        private String name;
        private String link;
        private String icon;
        private Set<String> permissions = new HashSet<>();

        public MenuItem() {
        }

        public MenuItem(String name, String link, String... permissions) {
            this.name = name;
            this.link = link;
            this.permissions.addAll(Arrays.asList(permissions));
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getLink() {
            return link;
        }

        public void setLink(String link) {
            this.link = link;
        }

        public String getIcon() {
            return icon;
        }

        public void setIcon(String icon) {
            this.icon = icon;
        }

        public Set<String> getPermissions() {
            return permissions;
        }

        public void setPermissions(Set<String> permissions) {
            this.permissions = permissions;
        }
    }

    private String name;
    private List<MenuItem> items = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setItems(List<MenuItem> items) {
        this.items = items;
    }

    public List<MenuItem> getItems() {
        return items;
    }
    
    public List<MenuItem> getFilteredItems(Set<String> userPermissions) {
        List<MenuItem> result = new ArrayList<>();
        for (MenuItem item : items) {
            if (userPermissions.containsAll(item.getPermissions())) {
                result.add(item);
            }
        }
        return result;
    }

    public Menu add(MenuItem item) {
        items.add(item);
        return this;
    }

    public Menu add(String name, String link, String... permissions) {
        return add(new MenuItem(name, link, permissions));
    }
}

package cn.enilu.flash.common.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class MenuList {
    private List<Menu> menus = new ArrayList<Menu>();

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }
    
    public void addMenu(Menu menu) {
        this.menus.add(menu);
    }

    public List<Menu> getFilteredMenus(Set<String> userPermissions) {
        List<Menu> result = new ArrayList<Menu>();
        for (Menu menu : menus) {
            if (!menu.getFilteredItems(userPermissions).isEmpty()) {
                result.add(menu);
            }
        }
        return result;
    }
}

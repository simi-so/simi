package ch.so.agi.simi.entity.extended;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum RelationType implements EnumClass<String> {

    DISPLAY("1_display"),
    DATA("2_data");

    private String id;

    RelationType(String value) {
        this.id = value;
    }

    public String getId() {
        return id;
    }

    @Nullable
    public static RelationType fromId(String id) {
        for (RelationType at : RelationType.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}
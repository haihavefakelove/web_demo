package model;

public enum EnumNotification {
    UNREAD("Chua doc"),
    READ("Da doc");
    private final String value;

    EnumNotification(String value) {
        this.value = value;
    }
    public String getValue() {
        return value;
    }

}

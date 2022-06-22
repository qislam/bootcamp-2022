/**
 * Utility class for managing date values in a customized way.
 * @author Qamar Islam (Incapsulate)
**/
public with sharing class CustomDate {
    public Integer day;
    public Integer month;
    public Integer year;

    public Date standardDate {
        get {
            if (this.standardDate == null) {
                this.standardDate = Date.newInstance(this.year, this.month, this.day);
            }
            return this.standardDate;
        }
        set;
    }

    public DateTime standardDateTime {
        get {
            if (this.standardDateTime == null) {
                this.standardDateTime = DateTime.newInstance(this.standardDate, Time.newInstance(0, 0, 0, 0));
            }
            return this.standardDateTime;
        }
        set;
    }

    public String dayOfWeek {
        get {
            if (this.dayOfWeek == null) {
                this.dayOfWeek = this.standardDateTime.format('EEEE');
            }
            return this.dayOfWeek;
        }
        set;
    }

    public String standardFormat {
        get {
            if (this.standardFormat == null) {
                this.standardFormat = this.month + '/' + this.day + '/' + this.year;
            } 
            return this.standardFormat;
        }
        set;
    }

    public String chatFormat {
        get {
            if (this.chatFormat == null) {
                this.chatFormat = this.dayOfWeek + ' ' + this.month + '/' + this.day + '/' + this.year;
            } 
            return this.chatFormat;
        }
        set;
    }

    public static CustomDate newInstance(String rawDate) {
        return new CustomDate(rawDate);
    }

    public CustomDate(String rawDate) {
        if (rawDate.length() > 10) {
            if (rawDate.contains('T')) { rawDate = rawDate.split('T')[0];}
            if (rawDate.contains(' ')) { rawDate = rawDate.split(' ')[0];}
        }
        if (!isValidDateString(rawDate)) {
            throw new IllegalArgumentException( rawDate + ' is not a valid date format.');
        } 

        if (rawDate.contains('-')) {
            String[] dateParts = rawDate.split('-');
            this.day = Integer.valueOf(dateParts[2]);
            this.month = Integer.valueOf(dateParts[1]);
            this.year = Integer.valueOf(dateParts[0]);
        }
    }

    private Boolean isValidDateString(String rawDate) {
        String[] validPatterns = new String[]{
            '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
        };
        for (String datePattern : validPatterns) {
            if (Pattern.compile(datePattern).matcher(rawDate).matches()) { return true; }
        }
        return false;
    }
}

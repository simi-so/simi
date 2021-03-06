package ch.so.agi.simi.entity.data;

import ch.so.agi.simi.entity.SimiEntity;
import com.haulmont.chile.core.annotations.NamePattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.List;

@Table(name = "SIMIDATA_POSTGRES_DB")
@Entity(name = PostgresDB.NAME)
@NamePattern("%s|dbName")
public class PostgresDB extends SimiEntity {
    private static final long serialVersionUID = 5599910294180509457L;

    public static final String NAME = "simiData_PostgresDB";

    @Column(name = "DB_NAME", nullable = false, unique = true, length = 100)
    @NotNull
    private String dbName;

    @NotNull
    @Column(name = "DB_SERVICE_URL", nullable = false, unique = true)
    private String dbServiceUrl;

    @Column(name = "DEFAULT_VALUE", nullable = false)
    @NotNull
    private Boolean defaultValue = false;

    @OneToMany(mappedBy = "postgresDB")
    private List<DataTheme> dataThemes;

    public String getDbServiceUrl() {
        return dbServiceUrl;
    }

    public void setDbServiceUrl(String dbServiceUrl) {
        this.dbServiceUrl = dbServiceUrl;
    }

    public List<DataTheme> getDataThemes() {
        return dataThemes;
    }

    public void setDataThemes(List<DataTheme> dataThemes) {
        this.dataThemes = dataThemes;
    }

    public Boolean getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(Boolean defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }
}
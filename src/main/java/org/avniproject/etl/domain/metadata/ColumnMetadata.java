package org.avniproject.etl.domain.metadata;

import org.avniproject.etl.domain.Model;
import org.avniproject.etl.domain.metadata.Column.Type;
import org.avniproject.etl.domain.metadata.diff.Diff;
import org.avniproject.etl.domain.metadata.diff.RenameColumn;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static java.lang.String.format;

public class ColumnMetadata extends Model {
    private final Column column;
    private final Integer conceptId;
    private final ConceptType conceptType;
    private final String conceptUuid;
    private final String parentConceptUuid;

    public enum ConceptType {
        Audio,
        Date,
        DateTime,
        Duration,
        File,
        GroupAffiliation,
        Id,
        Image,
        Location,
        MultiSelect,
        NA,
        Notes,
        Numeric,
        PhoneNumber,
        SingleSelect,
        Subject,
        Text,
        Time,
        Video;

        Column.Type getColumnDatatype() {
            switch (this) {
                case Numeric:
                    return Column.Type.numeric;
                case Date:
                    return Column.Type.date;
                case DateTime:
                    return Column.Type.timestamp;
                case Time:
                    return Column.Type.time;
                default:
                    return Column.Type.text;
            }
        }

    }

    public ColumnMetadata(Integer id, Column column, Integer conceptId, ConceptType conceptType, String conceptUuid, String parentConceptUuid) {
        super(id);
        this.column = column;
        this.conceptId = conceptId;
        this.conceptType = conceptType;
        this.conceptUuid = conceptUuid;
        this.parentConceptUuid = parentConceptUuid;
    }

    public ColumnMetadata(Integer id, String name, Integer conceptId, ConceptType conceptType, String conceptUuid) {
        this(id, conceptType == null ? new Column(name, null) : new Column(name, conceptType.getColumnDatatype()), conceptId, conceptType, conceptUuid, null);
    }

    public ColumnMetadata(Integer id, String name, Integer conceptId, ConceptType conceptType, String conceptUuid, String parentConceptUuid, Column.ColumnType columnType) {
        this(id, conceptType == null ? new Column(name, null, columnType) : new Column(name, conceptType.getColumnDatatype(), columnType), conceptId, conceptType, conceptUuid, parentConceptUuid);
    }

    public ColumnMetadata(Column column, Integer conceptId, ConceptType conceptType, String conceptUuid) {
        this(null, column, conceptId, conceptType, conceptUuid, null);
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public ConceptType getConceptType() {
        return conceptType;
    }

    public Column getColumn() {
        return this.column;
    }

    public String getName() {
        return column.getName();
    }

    public Type getType() {
        return column.getType();
    }

    public String getConceptUuid() {
        return conceptUuid;
    }

    public String getParentConceptUuid() {
        return parentConceptUuid;
    }

    public boolean matches(ColumnMetadata realColumn) {
        if (realColumn == null) return false;
        if (realColumn.getConceptUuid() == null && getConceptUuid() == null) {
            return getName().equals(realColumn.getName());
        }
        if (realColumn.getParentConceptUuid() != null) {
            return equalsIgnoreNulls(realColumn.getParentConceptUuid(), getParentConceptUuid()) &&
                    equalsIgnoreNulls(realColumn.getConceptUuid(), getConceptUuid());
        }
        return equalsIgnoreNulls(realColumn.getConceptUuid(), getConceptUuid());
    }

    public List<Diff> findChanges(TableMetadata newTable, ColumnMetadata oldColumnMetadata) {
        if (!getName().equals(oldColumnMetadata.getName())) {
            return List.of(new RenameColumn(newTable.getName(), oldColumnMetadata.getName(), getName()));
        }
        if (!getType().equals(oldColumnMetadata.getType())) {
            throw new RuntimeException(String.format("Change in datatype detected. Table: %s, Column: %s, Old Type: %s, New Type: %s", newTable.getName(), getName(), getType(), oldColumnMetadata.getType()));
        }
        return Collections.emptyList();
    }

    public void mergeWith(ColumnMetadata oldColumnMetadata) {
        setId(oldColumnMetadata.getId());
    }

    public String getJsonbExtractor() {
        if (parentConceptUuid != null) {
            return format("-> '%s' -> '%s'", parentConceptUuid, conceptUuid);
        }
        return format("-> '%s'", conceptUuid);
    }

    public String getTextExtractor() {
        if (parentConceptUuid != null) {
            return format("-> '%s' ->> '%s'", parentConceptUuid, conceptUuid);
        }
        return format("->> '%s'", conceptUuid);
    }
}

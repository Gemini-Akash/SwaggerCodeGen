/*
 * This file is generated by jOOQ.
 */
package entity.demo.tables.daos;


import entity.demo.tables.Language;
import entity.demo.tables.records.LanguageRecord;
import org.jooq.Configuration;
import org.jooq.impl.DAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * This class is generated by jOOQ.
 */
@SuppressWarnings({"all", "unchecked", "rawtypes"})
@Repository
public class LanguageDao extends DAOImpl<LanguageRecord, entity.demo.tables.pojos.Language, Integer> {

    /**
     * Create a new LanguageDao without any configuration
     */
    public LanguageDao() {
        super(Language.LANGUAGE, entity.demo.tables.pojos.Language.class);
    }

    /**
     * Create a new LanguageDao with an attached configuration
     */
    @Autowired
    public LanguageDao(Configuration configuration) {
        super(Language.LANGUAGE, entity.demo.tables.pojos.Language.class, configuration);
    }

    @Override
    public Integer getId(entity.demo.tables.pojos.Language object) {
        return object.getId();
    }

    /**
     * Fetch records that have <code>ID BETWEEN lowerInclusive AND upperInclusive</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchRangeOfId(Integer lowerInclusive, Integer upperInclusive) {
        return fetchRange(Language.LANGUAGE.ID, lowerInclusive, upperInclusive);
    }

    /**
     * Fetch records that have <code>ID IN (values)</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchById(Integer... values) {
        return fetch(Language.LANGUAGE.ID, values);
    }

    /**
     * Fetch a unique record that has <code>ID = value</code>
     */
    public entity.demo.tables.pojos.Language fetchOneById(Integer value) {
        return fetchOne(Language.LANGUAGE.ID, value);
    }

    /**
     * Fetch records that have <code>CD BETWEEN lowerInclusive AND upperInclusive</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchRangeOfCd(String lowerInclusive, String upperInclusive) {
        return fetchRange(Language.LANGUAGE.CD, lowerInclusive, upperInclusive);
    }

    /**
     * Fetch records that have <code>CD IN (values)</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchByCd(String... values) {
        return fetch(Language.LANGUAGE.CD, values);
    }

    /**
     * Fetch a unique record that has <code>CD = value</code>
     */
    public entity.demo.tables.pojos.Language fetchOneByCd(String value) {
        return fetchOne(Language.LANGUAGE.CD, value);
    }

    /**
     * Fetch records that have <code>DESCRIPTION BETWEEN lowerInclusive AND upperInclusive</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchRangeOfDescription(String lowerInclusive, String upperInclusive) {
        return fetchRange(Language.LANGUAGE.DESCRIPTION, lowerInclusive, upperInclusive);
    }

    /**
     * Fetch records that have <code>DESCRIPTION IN (values)</code>
     */
    public List<entity.demo.tables.pojos.Language> fetchByDescription(String... values) {
        return fetch(Language.LANGUAGE.DESCRIPTION, values);
    }

    /**
     * Created custom fetchRecord Method
     */
    public entity.demo.tables.pojos.Language fetchRecord(Integer Id) {
        return this.ctx().selectFrom(Language.LANGUAGE).where(Language.LANGUAGE.ID.eq(Id)).fetchOneInto(entity.demo.tables.pojos.Language.class);
    }

    /**
     * Created custom Insert records Method
     */
    public entity.demo.tables.pojos.Language insertRecord(entity.demo.tables.pojos.Language classObject) {
        LanguageRecord record = this.ctx().newRecord(Language.LANGUAGE);
        record.setCd(classObject.getCd());
        record.setDescription(classObject.getDescription());
        record.store();
        entity.demo.tables.pojos.Language result = record.into(entity.demo.tables.pojos.Language.class);
        return result;
    }

    /**
     * Created custom Delete record Method
     */
    public int deleteRecord(Integer Id) {
        int result = this.ctx().deleteFrom(Language.LANGUAGE).where(Language.LANGUAGE.ID.eq(Id)).execute();
        return result;
    }

    /**
     * Created custom Update record Method
     */
    public int updateRecord(entity.demo.tables.pojos.Language classObject) {
        int result = this.ctx().update(Language.LANGUAGE)
                .set(Language.LANGUAGE.CD, classObject.getCd())
                .set(Language.LANGUAGE.DESCRIPTION, classObject.getDescription())
                .where(Language.LANGUAGE.ID.eq(classObject.getId())).execute();
        return result;
    }
}

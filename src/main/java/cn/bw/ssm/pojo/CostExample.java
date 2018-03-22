package cn.bw.ssm.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class CostExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CostExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("ID is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("ID is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("ID =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("ID <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("ID >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ID >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("ID <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("ID <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("ID in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("ID not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("ID between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ID not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("NAME is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("NAME is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("NAME =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("NAME <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("NAME >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("NAME >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("NAME <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("NAME <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("NAME like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("NAME not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("NAME in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("NAME not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("NAME between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("NAME not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andBaseDurationIsNull() {
            addCriterion("BASE_DURATION is null");
            return (Criteria) this;
        }

        public Criteria andBaseDurationIsNotNull() {
            addCriterion("BASE_DURATION is not null");
            return (Criteria) this;
        }

        public Criteria andBaseDurationEqualTo(Integer value) {
            addCriterion("BASE_DURATION =", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationNotEqualTo(Integer value) {
            addCriterion("BASE_DURATION <>", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationGreaterThan(Integer value) {
            addCriterion("BASE_DURATION >", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationGreaterThanOrEqualTo(Integer value) {
            addCriterion("BASE_DURATION >=", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationLessThan(Integer value) {
            addCriterion("BASE_DURATION <", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationLessThanOrEqualTo(Integer value) {
            addCriterion("BASE_DURATION <=", value, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationIn(List<Integer> values) {
            addCriterion("BASE_DURATION in", values, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationNotIn(List<Integer> values) {
            addCriterion("BASE_DURATION not in", values, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationBetween(Integer value1, Integer value2) {
            addCriterion("BASE_DURATION between", value1, value2, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseDurationNotBetween(Integer value1, Integer value2) {
            addCriterion("BASE_DURATION not between", value1, value2, "baseDuration");
            return (Criteria) this;
        }

        public Criteria andBaseCostIsNull() {
            addCriterion("BASE_COST is null");
            return (Criteria) this;
        }

        public Criteria andBaseCostIsNotNull() {
            addCriterion("BASE_COST is not null");
            return (Criteria) this;
        }

        public Criteria andBaseCostEqualTo(Double value) {
            addCriterion("BASE_COST =", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostNotEqualTo(Double value) {
            addCriterion("BASE_COST <>", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostGreaterThan(Double value) {
            addCriterion("BASE_COST >", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostGreaterThanOrEqualTo(Double value) {
            addCriterion("BASE_COST >=", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostLessThan(Double value) {
            addCriterion("BASE_COST <", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostLessThanOrEqualTo(Double value) {
            addCriterion("BASE_COST <=", value, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostIn(List<Double> values) {
            addCriterion("BASE_COST in", values, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostNotIn(List<Double> values) {
            addCriterion("BASE_COST not in", values, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostBetween(Double value1, Double value2) {
            addCriterion("BASE_COST between", value1, value2, "baseCost");
            return (Criteria) this;
        }

        public Criteria andBaseCostNotBetween(Double value1, Double value2) {
            addCriterion("BASE_COST not between", value1, value2, "baseCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostIsNull() {
            addCriterion("UNIT_COST is null");
            return (Criteria) this;
        }

        public Criteria andUnitCostIsNotNull() {
            addCriterion("UNIT_COST is not null");
            return (Criteria) this;
        }

        public Criteria andUnitCostEqualTo(Double value) {
            addCriterion("UNIT_COST =", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostNotEqualTo(Double value) {
            addCriterion("UNIT_COST <>", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostGreaterThan(Double value) {
            addCriterion("UNIT_COST >", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostGreaterThanOrEqualTo(Double value) {
            addCriterion("UNIT_COST >=", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostLessThan(Double value) {
            addCriterion("UNIT_COST <", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostLessThanOrEqualTo(Double value) {
            addCriterion("UNIT_COST <=", value, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostIn(List<Double> values) {
            addCriterion("UNIT_COST in", values, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostNotIn(List<Double> values) {
            addCriterion("UNIT_COST not in", values, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostBetween(Double value1, Double value2) {
            addCriterion("UNIT_COST between", value1, value2, "unitCost");
            return (Criteria) this;
        }

        public Criteria andUnitCostNotBetween(Double value1, Double value2) {
            addCriterion("UNIT_COST not between", value1, value2, "unitCost");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("STATUS is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("STATUS is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("STATUS =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("STATUS <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("STATUS >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("STATUS >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("STATUS <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("STATUS <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("STATUS like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("STATUS not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("STATUS in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("STATUS not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("STATUS between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("STATUS not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andDescrIsNull() {
            addCriterion("DESCR is null");
            return (Criteria) this;
        }

        public Criteria andDescrIsNotNull() {
            addCriterion("DESCR is not null");
            return (Criteria) this;
        }

        public Criteria andDescrEqualTo(String value) {
            addCriterion("DESCR =", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrNotEqualTo(String value) {
            addCriterion("DESCR <>", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrGreaterThan(String value) {
            addCriterion("DESCR >", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrGreaterThanOrEqualTo(String value) {
            addCriterion("DESCR >=", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrLessThan(String value) {
            addCriterion("DESCR <", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrLessThanOrEqualTo(String value) {
            addCriterion("DESCR <=", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrLike(String value) {
            addCriterion("DESCR like", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrNotLike(String value) {
            addCriterion("DESCR not like", value, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrIn(List<String> values) {
            addCriterion("DESCR in", values, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrNotIn(List<String> values) {
            addCriterion("DESCR not in", values, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrBetween(String value1, String value2) {
            addCriterion("DESCR between", value1, value2, "descr");
            return (Criteria) this;
        }

        public Criteria andDescrNotBetween(String value1, String value2) {
            addCriterion("DESCR not between", value1, value2, "descr");
            return (Criteria) this;
        }

        public Criteria andCreatimeIsNull() {
            addCriterion("CREATIME is null");
            return (Criteria) this;
        }

        public Criteria andCreatimeIsNotNull() {
            addCriterion("CREATIME is not null");
            return (Criteria) this;
        }

        public Criteria andCreatimeEqualTo(Date value) {
            addCriterion("CREATIME =", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeNotEqualTo(Date value) {
            addCriterion("CREATIME <>", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeGreaterThan(Date value) {
            addCriterion("CREATIME >", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATIME >=", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeLessThan(Date value) {
            addCriterion("CREATIME <", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeLessThanOrEqualTo(Date value) {
            addCriterion("CREATIME <=", value, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeIn(List<Date> values) {
            addCriterion("CREATIME in", values, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeNotIn(List<Date> values) {
            addCriterion("CREATIME not in", values, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeBetween(Date value1, Date value2) {
            addCriterion("CREATIME between", value1, value2, "creatime");
            return (Criteria) this;
        }

        public Criteria andCreatimeNotBetween(Date value1, Date value2) {
            addCriterion("CREATIME not between", value1, value2, "creatime");
            return (Criteria) this;
        }

        public Criteria andStartimeIsNull() {
            addCriterion("STARTIME is null");
            return (Criteria) this;
        }

        public Criteria andStartimeIsNotNull() {
            addCriterion("STARTIME is not null");
            return (Criteria) this;
        }

        public Criteria andStartimeEqualTo(Date value) {
            addCriterionForJDBCDate("STARTIME =", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("STARTIME <>", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeGreaterThan(Date value) {
            addCriterionForJDBCDate("STARTIME >", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("STARTIME >=", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeLessThan(Date value) {
            addCriterionForJDBCDate("STARTIME <", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("STARTIME <=", value, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeIn(List<Date> values) {
            addCriterionForJDBCDate("STARTIME in", values, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("STARTIME not in", values, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("STARTIME between", value1, value2, "startime");
            return (Criteria) this;
        }

        public Criteria andStartimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("STARTIME not between", value1, value2, "startime");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNull() {
            addCriterion("COST_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNotNull() {
            addCriterion("COST_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andCostTypeEqualTo(String value) {
            addCriterion("COST_TYPE =", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotEqualTo(String value) {
            addCriterion("COST_TYPE <>", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThan(String value) {
            addCriterion("COST_TYPE >", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThanOrEqualTo(String value) {
            addCriterion("COST_TYPE >=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThan(String value) {
            addCriterion("COST_TYPE <", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThanOrEqualTo(String value) {
            addCriterion("COST_TYPE <=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLike(String value) {
            addCriterion("COST_TYPE like", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotLike(String value) {
            addCriterion("COST_TYPE not like", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeIn(List<String> values) {
            addCriterion("COST_TYPE in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotIn(List<String> values) {
            addCriterion("COST_TYPE not in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeBetween(String value1, String value2) {
            addCriterion("COST_TYPE between", value1, value2, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotBetween(String value1, String value2) {
            addCriterion("COST_TYPE not between", value1, value2, "costType");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
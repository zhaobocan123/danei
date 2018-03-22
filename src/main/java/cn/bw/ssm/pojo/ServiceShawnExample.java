package cn.bw.ssm.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ServiceShawnExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ServiceShawnExample() {
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

        public Criteria andAccountIdIsNull() {
            addCriterion("ACCOUNT_ID is null");
            return (Criteria) this;
        }

        public Criteria andAccountIdIsNotNull() {
            addCriterion("ACCOUNT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andAccountIdEqualTo(Integer value) {
            addCriterion("ACCOUNT_ID =", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotEqualTo(Integer value) {
            addCriterion("ACCOUNT_ID <>", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThan(Integer value) {
            addCriterion("ACCOUNT_ID >", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ACCOUNT_ID >=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThan(Integer value) {
            addCriterion("ACCOUNT_ID <", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThanOrEqualTo(Integer value) {
            addCriterion("ACCOUNT_ID <=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdIn(List<Integer> values) {
            addCriterion("ACCOUNT_ID in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotIn(List<Integer> values) {
            addCriterion("ACCOUNT_ID not in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdBetween(Integer value1, Integer value2) {
            addCriterion("ACCOUNT_ID between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ACCOUNT_ID not between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andUnixHostIsNull() {
            addCriterion("UNIX_HOST is null");
            return (Criteria) this;
        }

        public Criteria andUnixHostIsNotNull() {
            addCriterion("UNIX_HOST is not null");
            return (Criteria) this;
        }

        public Criteria andUnixHostEqualTo(String value) {
            addCriterion("UNIX_HOST =", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostNotEqualTo(String value) {
            addCriterion("UNIX_HOST <>", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostGreaterThan(String value) {
            addCriterion("UNIX_HOST >", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostGreaterThanOrEqualTo(String value) {
            addCriterion("UNIX_HOST >=", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostLessThan(String value) {
            addCriterion("UNIX_HOST <", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostLessThanOrEqualTo(String value) {
            addCriterion("UNIX_HOST <=", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostLike(String value) {
            addCriterion("UNIX_HOST like", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostNotLike(String value) {
            addCriterion("UNIX_HOST not like", value, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostIn(List<String> values) {
            addCriterion("UNIX_HOST in", values, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostNotIn(List<String> values) {
            addCriterion("UNIX_HOST not in", values, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostBetween(String value1, String value2) {
            addCriterion("UNIX_HOST between", value1, value2, "unixHost");
            return (Criteria) this;
        }

        public Criteria andUnixHostNotBetween(String value1, String value2) {
            addCriterion("UNIX_HOST not between", value1, value2, "unixHost");
            return (Criteria) this;
        }

        public Criteria andOsUsernameIsNull() {
            addCriterion("OS_USERNAME is null");
            return (Criteria) this;
        }

        public Criteria andOsUsernameIsNotNull() {
            addCriterion("OS_USERNAME is not null");
            return (Criteria) this;
        }

        public Criteria andOsUsernameEqualTo(String value) {
            addCriterion("OS_USERNAME =", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameNotEqualTo(String value) {
            addCriterion("OS_USERNAME <>", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameGreaterThan(String value) {
            addCriterion("OS_USERNAME >", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("OS_USERNAME >=", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameLessThan(String value) {
            addCriterion("OS_USERNAME <", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameLessThanOrEqualTo(String value) {
            addCriterion("OS_USERNAME <=", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameLike(String value) {
            addCriterion("OS_USERNAME like", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameNotLike(String value) {
            addCriterion("OS_USERNAME not like", value, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameIn(List<String> values) {
            addCriterion("OS_USERNAME in", values, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameNotIn(List<String> values) {
            addCriterion("OS_USERNAME not in", values, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameBetween(String value1, String value2) {
            addCriterion("OS_USERNAME between", value1, value2, "osUsername");
            return (Criteria) this;
        }

        public Criteria andOsUsernameNotBetween(String value1, String value2) {
            addCriterion("OS_USERNAME not between", value1, value2, "osUsername");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdIsNull() {
            addCriterion("LOGIN_PASSWD is null");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdIsNotNull() {
            addCriterion("LOGIN_PASSWD is not null");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdEqualTo(String value) {
            addCriterion("LOGIN_PASSWD =", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdNotEqualTo(String value) {
            addCriterion("LOGIN_PASSWD <>", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdGreaterThan(String value) {
            addCriterion("LOGIN_PASSWD >", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdGreaterThanOrEqualTo(String value) {
            addCriterion("LOGIN_PASSWD >=", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdLessThan(String value) {
            addCriterion("LOGIN_PASSWD <", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdLessThanOrEqualTo(String value) {
            addCriterion("LOGIN_PASSWD <=", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdLike(String value) {
            addCriterion("LOGIN_PASSWD like", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdNotLike(String value) {
            addCriterion("LOGIN_PASSWD not like", value, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdIn(List<String> values) {
            addCriterion("LOGIN_PASSWD in", values, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdNotIn(List<String> values) {
            addCriterion("LOGIN_PASSWD not in", values, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdBetween(String value1, String value2) {
            addCriterion("LOGIN_PASSWD between", value1, value2, "loginPasswd");
            return (Criteria) this;
        }

        public Criteria andLoginPasswdNotBetween(String value1, String value2) {
            addCriterion("LOGIN_PASSWD not between", value1, value2, "loginPasswd");
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

        public Criteria andCreateDateIsNull() {
            addCriterion("CREATE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("CREATE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("CREATE_DATE =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("CREATE_DATE <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("CREATE_DATE >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("CREATE_DATE <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_DATE <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("CREATE_DATE in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("CREATE_DATE not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_DATE not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateIsNull() {
            addCriterion("PAUSE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andPauseDateIsNotNull() {
            addCriterion("PAUSE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andPauseDateEqualTo(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE =", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE <>", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateGreaterThan(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE >", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE >=", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateLessThan(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE <", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("PAUSE_DATE <=", value, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateIn(List<Date> values) {
            addCriterionForJDBCDate("PAUSE_DATE in", values, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("PAUSE_DATE not in", values, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("PAUSE_DATE between", value1, value2, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andPauseDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("PAUSE_DATE not between", value1, value2, "pauseDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateIsNull() {
            addCriterion("CLOSE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andCloseDateIsNotNull() {
            addCriterion("CLOSE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andCloseDateEqualTo(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE =", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE <>", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateGreaterThan(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE >", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE >=", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateLessThan(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE <", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("CLOSE_DATE <=", value, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateIn(List<Date> values) {
            addCriterionForJDBCDate("CLOSE_DATE in", values, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("CLOSE_DATE not in", values, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("CLOSE_DATE between", value1, value2, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCloseDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("CLOSE_DATE not between", value1, value2, "closeDate");
            return (Criteria) this;
        }

        public Criteria andCostIdIsNull() {
            addCriterion("COST_ID is null");
            return (Criteria) this;
        }

        public Criteria andCostIdIsNotNull() {
            addCriterion("COST_ID is not null");
            return (Criteria) this;
        }

        public Criteria andCostIdEqualTo(Integer value) {
            addCriterion("COST_ID =", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdNotEqualTo(Integer value) {
            addCriterion("COST_ID <>", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdGreaterThan(Integer value) {
            addCriterion("COST_ID >", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("COST_ID >=", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdLessThan(Integer value) {
            addCriterion("COST_ID <", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdLessThanOrEqualTo(Integer value) {
            addCriterion("COST_ID <=", value, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdIn(List<Integer> values) {
            addCriterion("COST_ID in", values, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdNotIn(List<Integer> values) {
            addCriterion("COST_ID not in", values, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdBetween(Integer value1, Integer value2) {
            addCriterion("COST_ID between", value1, value2, "costId");
            return (Criteria) this;
        }

        public Criteria andCostIdNotBetween(Integer value1, Integer value2) {
            addCriterion("COST_ID not between", value1, value2, "costId");
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
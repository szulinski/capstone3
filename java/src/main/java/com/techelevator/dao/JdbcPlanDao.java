package com.techelevator.dao;
import com.techelevator.model.Plan;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;


public class JdbcPlanDao implements PlanDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcPlanDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Plan getPlan (Long planId) {
        Plan plan = null;
        String sql = "Select * From plan WHERE plan_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, planId);
        if (results.next()) {
            plan = mapRowToPlan(results);
        }
        return plan;
    }

    @Override
    public boolean createPlan(Long planId, String planName) {
        String sql = "INSERT INTO plan " +
                "(plan_name) values(?)";
        try {
            jdbcTemplate.update(sql, planId, planName);
        } catch (DataAccessException e) {
            return false;
        }
        return true;
    }
    private Plan mapRowToPlan(SqlRowSet rs) {
        Plan plan = new Plan();
        plan.setPlanId(rs.getLong("plan_id"));
        plan.setPlanName(rs.getString("meal_name"));
        return plan;
    }
}

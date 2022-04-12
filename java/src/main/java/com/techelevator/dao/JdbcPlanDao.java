package com.techelevator.dao;
import com.techelevator.model.Plan;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcPlanDao implements PlanDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcPlanDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Plan findPlanById (Long planId) {
        Plan plan = null;
        String sql = "SELECT * FROM plans WHERE plan_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, planId);
        if (results.next()) {
            plan = mapRowToPlan(results);
        }
        return plan;
    }

    @Override
    public boolean createPlan(String planName) {
        String sql = "INSERT INTO plans " +
                "(plan_name) values(?)";
        try {
            jdbcTemplate.update(sql, planName);
        } catch (DataAccessException e) {
            return false;
        }
        return true;
    }
    private Plan mapRowToPlan(SqlRowSet rs) {
        Plan plan = new Plan();
        plan.setPlanId(rs.getLong("plan_id"));
        plan.setPlanName(rs.getString("plan_name"));
        return plan;
    }
}

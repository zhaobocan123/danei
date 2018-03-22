package cn.bw.ssm.mapper;

import cn.bw.ssm.pojo.Cost;
import cn.bw.ssm.pojo.CostExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CostMapper {
    int countByExample(CostExample example);

    int deleteByExample(CostExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Cost record);

    int insertSelective(Cost record);

    List<Cost> selectByExample(CostExample example);

    Cost selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Cost record, @Param("example") CostExample example);

    int updateByExample(@Param("record") Cost record, @Param("example") CostExample example);

    int updateByPrimaryKeySelective(Cost record);

    int updateByPrimaryKey(Cost record);
}
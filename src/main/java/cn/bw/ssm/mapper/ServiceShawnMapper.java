package cn.bw.ssm.mapper;

import cn.bw.ssm.pojo.ServiceShawn;
import cn.bw.ssm.pojo.ServiceShawnExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ServiceShawnMapper {
    int countByExample(ServiceShawnExample example);

    int deleteByExample(ServiceShawnExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ServiceShawn record);

    int insertSelective(ServiceShawn record);

    List<ServiceShawn> selectByExample(ServiceShawnExample example);

    ServiceShawn selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ServiceShawn record, @Param("example") ServiceShawnExample example);

    int updateByExample(@Param("record") ServiceShawn record, @Param("example") ServiceShawnExample example);

    int updateByPrimaryKeySelective(ServiceShawn record);

    int updateByPrimaryKey(ServiceShawn record);
}
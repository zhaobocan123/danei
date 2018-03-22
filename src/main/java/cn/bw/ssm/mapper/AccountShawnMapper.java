package cn.bw.ssm.mapper;

import cn.bw.ssm.pojo.AccountShawn;
import cn.bw.ssm.pojo.AccountShawnExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccountShawnMapper {
    int countByExample(AccountShawnExample example);

    int deleteByExample(AccountShawnExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AccountShawn record);

    int insertSelective(AccountShawn record);

    List<AccountShawn> selectByExample(AccountShawnExample example);

    AccountShawn selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AccountShawn record, @Param("example") AccountShawnExample example);

    int updateByExample(@Param("record") AccountShawn record, @Param("example") AccountShawnExample example);

    int updateByPrimaryKeySelective(AccountShawn record);

    int updateByPrimaryKey(AccountShawn record);
}
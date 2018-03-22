package cn.bw.ssm.text;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.bw.ssm.mapper.CostMapper;
import cn.bw.ssm.pojo.Cost;
@ContextConfiguration(locations={"classpath:spring/applicationContext-dao.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class CostMapperTest {
	@Autowired
	CostMapper cm;
	@Test
	public void testSelectByPrimaryKey() {
		Cost selectByPrimaryKey = cm.selectByPrimaryKey(1);
		System.out.println(selectByPrimaryKey.getName());
	}

}

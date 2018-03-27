package cn.bw.ssm.service;

import java.util.List;
import java.util.Map;

import cn.bw.ssm.pojo.Cost;
import cn.bw.ssm.pojo.CostVO;

public interface TariffService {
	//查询多少条数据
	int selectByCount();
	//查询数据并回显
	List<Cost> selectByCostAll(Map map);
	//更改状态 开通
	void alterStatus(String id);
	//修改回显
	Cost selectByHuiXian(Integer id);
	//修改数据
	void update(Cost co);

}

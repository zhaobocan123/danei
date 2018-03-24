package cn.bw.ssm.service;

import java.util.List;
import java.util.Map;

import cn.bw.ssm.pojo.Cost;

public interface TariffService {
	//查询多少条数据
	int selectByCount();
	//查询数据并回显
	List<Cost> selectByCostAll(Map map);

}

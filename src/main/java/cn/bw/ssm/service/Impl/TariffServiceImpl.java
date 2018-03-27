package cn.bw.ssm.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bw.ssm.mapper.CostMapper;
import cn.bw.ssm.pojo.Cost;
import cn.bw.ssm.pojo.CostVO;
import cn.bw.ssm.service.TariffService;
@Service
public class TariffServiceImpl implements TariffService {
	@Autowired
	CostMapper cm;
	
	//查询多少条数据
	@Override
	public int selectByCount() {
		// TODO Auto-generated method stub
		return cm.countByExample(null);
	}
	//查询数据并回显
	@Override
	public List<Cost> selectByCostAll(Map map) {
		// TODO Auto-generated method stub
		return cm.selectByCostAll(map);
	}
	//更改状态 开通
	@Override
	public void alterStatus(String id) {
		// TODO Auto-generated method stub
		Cost co = new Cost();
		co.setId(Integer.parseInt(id));
		co.setStatus("1");
		cm.updateByPrimaryKey(co);
		
	}
	//修改回显
	@Override
	public Cost selectByHuiXian(Integer id) {
		// TODO Auto-generated method stub
		return   cm.selectByPrimaryKey(id);
	}
	//修改数据
	@Override
	public void update(Cost co) {
		// TODO Auto-generated method stub
		cm.updateByPrimaryKey(co);
	}

}

package cn.bw.ssm.service.Impl;




import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bw.ssm.mapper.CostMapper;
import cn.bw.ssm.pojo.Cost;
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
		co.setStartime(new Date());
		cm.updateByPrimaryKeySelective(co);
		
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
		cm.updateByPrimaryKeySelective(co);
	}
	//显示详细信息
	@Override
	public Cost selectById(int parseInt) {
		// TODO Auto-generated method stub
		return cm.selectByPrimaryKey(parseInt);
	}
	//增加功能
	@Override
	public void addCost(Cost co) {
		// TODO Auto-generated method stub
		cm.insertSelective(co);
	}

}

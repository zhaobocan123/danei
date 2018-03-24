package cn.bw.ssm.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.bw.ssm.Util.PageUtil;
import cn.bw.ssm.pojo.Cost;
import cn.bw.ssm.pojo.CostVO;
import cn.bw.ssm.service.TariffService;


@Controller
@RequestMapping("/cost")
public class Tariff {
	
	@Autowired
	TariffService tar;
	
	//初始化查询分页带排序功能
	@RequestMapping("/listCost.do")
	public ModelAndView listCost( CostVO vo) throws UnsupportedEncodingException {
		String name = null;
		String sort = null;
		if(vo.getName_sort() != null) {
		 name = new String(vo.getName_sort().getBytes("iso8859-1"),"utf-8");
		}
		if(vo.getPai_sort() !=null) {
			sort = new String(vo.getPai_sort().getBytes("iso8859-1"),"utf-8");
		}
		System.out.println("名字是"+name);
		System.out.println("排序是"+sort);
		System.out.println("页码是"+vo.getPage());
		int count = tar.selectByCount();
		PageUtil PU = new PageUtil(vo.getPage(),5,count);
		System.out.println("一共"+count);
		Map map = new HashMap();
		map.put("PageUtil", PU);
		map.put("name", name);
		map.put("sort", sort);
		List<Cost> cost = tar.selectByCostAll(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cost",cost);
		mv.addObject("map",map);
		mv.setViewName("cost/list");
		return mv;
		
	}
	//测试用
	@RequestMapping("/list.do")
	public ModelAndView test1() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cost/list");
		
		return mv;
		
	}
}

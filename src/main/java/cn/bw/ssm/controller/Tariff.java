package cn.bw.ssm.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value=("/listCost.do")
			)
	public ModelAndView listCost( CostVO vo) throws UnsupportedEncodingException {
		System.out.println(vo.getName_sort()+"*");
		System.out.println(vo.getPai_sort()+"*");
		System.out.println(vo.getPage()+"*");
		String name = "";
		String sort = "";
		if(vo.getName_sort() != null) {
		 name = new String(vo.getName_sort().getBytes("iso8859-1"),"utf-8");
		 vo.setName_sort(name);
		 System.out.println(vo.getName_sort()+"**");
		}
		if(vo.getPai_sort() !=null) {
			sort = new String(vo.getPai_sort().getBytes("iso8859-1"),"utf-8");
			
		}
		if(sort.equals("sort_desc")) {
			sort = "倒序";
		}
		if(sort.equals("sort_asc")) {
			sort = "正序";
		}
		int count = tar.selectByCount();
		PageUtil PU = new PageUtil(vo.getPage(),5,count);
		if(sort.equals("倒序")) {
			vo.setDian_sort("sort_desc");
		}if(sort.equals("正序")) {
			vo.setDian_sort("sort_asc");
		}
		Map map = new HashMap();
		map.put("PageUtil", PU);
		map.put("name", name);
		map.put("sort", sort);
		List<Cost> cost = tar.selectByCostAll(map);
		if(vo.getDian_sort()==null || vo.getDian_sort()=="") {
			vo.setDian_sort("sort_asc");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cost",cost);
		mv.addObject("map",map);
		mv.addObject("vo",vo);
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
	//更改状态
	@ResponseBody
	@RequestMapping(value=("/startCost.do"), method=RequestMethod.POST)//zheli这里写psot 怎么写查一下 wang
	public String  alterStatus(String page, String id) {
		tar.alterStatus(id);
		return true + "";
	}
	//修改回显
/*	toModifyCost.do*/
	@RequestMapping(value=("/toModifyCost.do"))
	public ModelAndView huixian(CostVO vo) {
		Cost co = tar.selectByHuiXian(vo.getId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("co",co);
		mv.addObject("vo",vo);
		mv.setViewName("cost/edit");
		return mv;
		
	}
	//修改数据
	@RequestMapping(value=("/saveCost.do"))
	public String alterDate(Cost co,CostVO vo) throws UnsupportedEncodingException {
		String descr1 = "";
		String name1 = "";
		String namesort1="";
		if(co.getName() != null || co.getName() != "") {
			descr1 = new String(co.getDescr().getBytes("iso8859-1"),"utf-8");
			co.setDescr(descr1);
		}
		if(co.getName() != null || co.getName() != "") {
			name1 = new String(co.getName().getBytes("iso8859-1"),"utf-8");
			co.setName(name1);
		}
		if(vo.getName_sort() != null || vo.getName_sort() != "") {
			namesort1 = new String(vo.getName_sort().getBytes("iso8859-1"),"utf-8");
			vo.setName_sort(namesort1);
		}
			tar.update(co);
			String namesort2 = vo.getName_sort();
			String paistort2 = vo.getDian_sort();
			String page = vo.getPage();
	
		return "forward:/cost/listCost.do?pai_sort="+paistort2;
	}
}

package com.sxt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.service.RoomService;
import com.sxt.vo.RoomVo;


/**
 * room表
 * @author xjh
 *
 */
@Controller
@RequestMapping("room")
public class RoomController {
	@Autowired
	private RoomService roomService;

	/**
	 * 全查询
	 * @param vo
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public Map<String, Object> queryAll(RoomVo vo){
		Map<String, Object> map=new HashMap<String, Object>();
		List<RoomVo> list = roomService.queryAll(vo);
		map.put("totle", list.size());
		map.put("rows", list);
		 return map;
		
	}
	
	/**
	 * 添加房间
	 * @param vo
	 * @return
	 */
	@RequestMapping("addRoom")
	@ResponseBody
	public Map<String, Object> addRoom(RoomVo vo){
		Map<String, Object> map=new HashMap<String, Object>();
		String msg="添加成功";
		
		try {
			roomService.addRoom(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			msg="添加失败"+e.getMessage();
		}

		map.put("msg", msg);
		
		 return map;
		
	}
	
	/**
	 *删除
	 * @param vo
	 * @return
	 */
	@RequestMapping("deleteRoom")
	@ResponseBody
	public Map<String, Object> deleteRoom(RoomVo vo){
		Map<String, Object> map=new HashMap<String, Object>();
		String msg="删除成功";
		
		try {
			roomService.deleteRoom(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			msg="删除失败"+e.getMessage();
		}

		map.put("msg", msg);
		
		 return map;
		
	}
	
}

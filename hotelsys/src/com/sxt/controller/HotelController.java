package com.sxt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxt.domain.Hotel;
import com.sxt.service.HotelService;


/**
 * hotel表
 * @author xjh
 *
 */
@Controller
@RequestMapping("hotel")
public class HotelController {

	@Autowired
	private HotelService hotelService;
	
	/**
	 * 全查询
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<Hotel> queryAll(){
		return hotelService.queryAll();
	}
}

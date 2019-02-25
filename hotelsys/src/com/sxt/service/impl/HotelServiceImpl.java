package com.sxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxt.domain.Hotel;
import com.sxt.mapper.HotelMapper;
import com.sxt.service.HotelService;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelMapper hotelMapper;
	@Override
	public List<Hotel> queryAll() {
		// TODO Auto-generated method stub
		return hotelMapper.queryAll();
	}

}

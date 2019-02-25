package com.sxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxt.mapper.RoomMapper;
import com.sxt.service.RoomService;
import com.sxt.vo.RoomVo;


@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomMapper roomMapper;

	@Override
	public List<RoomVo> queryAll(RoomVo vo) {
		// TODO Auto-generated method stub
		return roomMapper.queryAll(vo);
	}

	@Override
	public void deleteRoom(RoomVo vo) {
		// TODO Auto-generated method stub
		roomMapper.deleteByPrimaryKey(vo.getId());
		
	}

	@Override
	public void addRoom(RoomVo vo) {
		// TODO Auto-generated method stub
		roomMapper.insert(vo);
		
	}

}

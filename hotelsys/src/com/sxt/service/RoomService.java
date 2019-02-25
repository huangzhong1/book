package com.sxt.service;

import java.util.List;

import com.sxt.vo.RoomVo;

public interface RoomService {

	List<RoomVo> queryAll(RoomVo vo);

	void deleteRoom(RoomVo vo);

	void addRoom(RoomVo vo);

}

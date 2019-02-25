package com.sxt.mapper;

import java.util.List;

import com.sxt.domain.Room;
import com.sxt.vo.RoomVo;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);

	List<RoomVo> queryAll(RoomVo vo);
}
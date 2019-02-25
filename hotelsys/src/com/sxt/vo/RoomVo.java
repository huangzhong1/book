package com.sxt.vo;

import com.sxt.domain.Room;

public class RoomVo extends Room {
		
	 private Integer hotelid;

	  private String name;

	    private String address;

	    private String mobile;
	    
	    

		public Integer getHotelid() {
			return hotelid;
		}

		public void setHotelid(Integer hotelid) {
			this.hotelid = hotelid;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
	    
	    

}

package com.discardpast.louwailou.service;

import com.discardpast.louwailou.domain.HouseApartmenimage;


/**
 * @author discardpast@yeah.net
 * @apiNote 房屋信息图片表(HouseApartmenimage)服务接口
 * @since 2019-10-31 11:59:36
 */
public interface HouseApartmenimageService {

    /**
     * 通过id查询一条房屋信息图片表数据
     * @param id
     * @return
     */
     HouseApartmenimage queryById(Long id);


    /**
     * 插入一条房屋信息图片表数据
     * @param houseApartmenimage
     * @return
     */
     Integer addHouseApartmenimage(HouseApartmenimage houseApartmenimage);

    /**
     * 更新一条房屋信息图片表数据
     * @param houseApartmenimage
     * @return
     */
     Integer updateHouseApartmenimage(HouseApartmenimage houseApartmenimage);

    /**
     * 移除一条房屋信息图片表数据
     * @param id
     * @return
     */
     Integer removeHouseApartmenimageById(Long id);
}

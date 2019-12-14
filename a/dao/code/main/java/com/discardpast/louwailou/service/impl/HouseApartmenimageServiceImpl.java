package com.discardpast.louwailou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.discardpast.louwailou.service.HouseApartmenimageService;
import com.discardpast.louwailou.mapper.HouseApartmenimageMapper;
import com.discardpast.louwailou.domain.HouseApartmenimage;


/**
 * @author discardpast@yeah.net
 * @apiNote 房屋信息图片表(HouseApartmenimage)服务实现类
 * @since 2019-10-31 11:59:36
 */
@Service
public class HouseApartmenimageServiceImpl implements HouseApartmenimageService {

    @Autowired
    private HouseApartmenimageMapper houseApartmenimageMapper;

    @Override
    public HouseApartmenimage queryById(Long id) {
        return this.houseApartmenimageMapper.selectById(id);
    }

    @Override
    public Integer addHouseApartmenimage(HouseApartmenimage houseApartmenimage) {
        return this.houseApartmenimageMapper.insert(houseApartmenimage);
    }

    @Override
    public Integer updateHouseApartmenimage(HouseApartmenimage houseApartmenimage) {
        return this.houseApartmenimageMapper.updateById(houseApartmenimage);
    }

    @Override
    public Integer removeHouseApartmenimageById(Long id) {
        return this.houseApartmenimageMapper.deleteById(id);
    }
}

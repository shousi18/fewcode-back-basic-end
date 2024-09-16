package com.fewcode.system.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fewcode.common.util.TransformUtils;
import com.fewcode.system.bean.DictData;
import com.fewcode.system.mapper.DictDataMapper;
import com.fewcode.system.service.IDictDataService;
import com.fewcode.system.vo.model.DictDataModel;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 系统管理-字典数据表 服务实现类
 * </p>
 *
 * @author 文艺倾年
 * @since 2021-12-07
 */
@Service
@AllArgsConstructor
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements IDictDataService {

    private final DictDataMapper dictDataMapper;

    @Override
    public List<DictDataModel> getDictByCode(String code) {
        List<DictData> dataList = dictDataMapper.selectList(Wrappers.lambdaQuery(DictData.class)
                .eq(DictData::getDictCode, code)
                .eq(DictData::getStatus, true)
                .orderByAsc(DictData::getDictSort));
        return TransformUtils.mapList(dataList, DictDataModel.class);
    }
}

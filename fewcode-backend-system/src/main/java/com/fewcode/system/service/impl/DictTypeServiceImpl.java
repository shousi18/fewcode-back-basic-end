package com.fewcode.system.service.impl;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fewcode.common.config.exception.ErrorCode;
import com.fewcode.common.config.exception.CommonException;
import com.fewcode.common.util.TransformUtils;
import com.fewcode.system.bean.DictData;
import com.fewcode.system.bean.DictType;
import com.fewcode.system.mapper.DictDataMapper;
import com.fewcode.system.mapper.DictTypeMapper;
import com.fewcode.system.service.IDictDataService;
import com.fewcode.system.service.IDictTypeService;
import com.fewcode.system.vo.model.DictDataModel;
import com.fewcode.system.vo.model.DictTypeModel;
import com.fewcode.system.vo.query.DictTypePageQuery;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;

/**
 * 系统管理-字典类型Service业务层处理
 *
 * @author 文艺倾年
 */
@Service
@AllArgsConstructor
public class DictTypeServiceImpl extends ServiceImpl<DictTypeMapper, DictType> implements IDictTypeService {

    private final DictTypeMapper dictTypeMapper;

    private final DictDataMapper dictDataMapper;

    private final IDictDataService dictDataService;

    @Override
    public IPage<DictTypeModel> getPageList(DictTypePageQuery query) {
        return dictTypeMapper.getPageList(query.getPage(), query.getQuery());
    }

    @Override
    public DictTypeModel getDictTypeById(Long id) {
        DictTypeModel dictTypeModel = TransformUtils.map(dictTypeMapper.selectById(id), DictTypeModel.class);
        dictTypeModel.setDictDataModelList(
                TransformUtils.mapList(dictDataMapper.selectList(Wrappers.lambdaQuery(DictData.class)
                                .eq(DictData::getDictCode, dictTypeModel.getDictCode())),
                        DictDataModel.class));
        return dictTypeModel;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createDictType(DictTypeModel model) {
        DictType dictType = TransformUtils.map(model, DictType.class);
        dictTypeMapper.insert(dictType);
        insertDictData(model.getDictDataModelList(), model.getDictCode());
        return dictType.getId();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDictType(DictTypeModel model) {
        dictTypeMapper.updateById(TransformUtils.map(model, DictType.class));
        dictDataMapper.delete(Wrappers.lambdaUpdate(DictData.class).eq(DictData::getDictCode, model.getDictCode()));
        insertDictData(model.getDictDataModelList(), model.getDictCode());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deleteDictType(Long id) {
        DictType dictType = dictTypeMapper.selectById(id);
        if (Objects.isNull(dictType)) {
            throw new CommonException(ErrorCode.NOT_FIND_DATA);
        }
        dictDataMapper.delete(Wrappers.lambdaUpdate(DictData.class).eq(DictData::getDictCode, dictType.getDictCode()));
        return dictTypeMapper.deleteById(id);
    }

    @Override
    public List<DictTypeModel> getDictTypeList() {
        List<DictType> dictTypeList = dictTypeMapper.selectList(Wrappers.lambdaQuery(DictType.class).eq(DictType::getStatus, true));
        return TransformUtils.mapList(dictTypeList, DictTypeModel.class);
    }

    /**
     * 添加子表信息
     *
     * @param models   子表信息集合
     * @param dictCode 字段编码
     */
    private void insertDictData(List<DictDataModel> models, String dictCode) {
        if (CollectionUtils.isEmpty(models)) {
            return;
        }
        List<DictData> dictDataList = TransformUtils.mapList(models, DictData.class);
        dictDataList.forEach(data -> data.setDictCode(dictCode));
        dictDataService.saveBatch(dictDataList);
    }
}
